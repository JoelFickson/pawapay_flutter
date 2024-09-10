import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pawapay_flutter/core/models/pawapay_network_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'constants.dart';
import 'logger_service.dart';

class NetworkHandler {
  late final Dio _dio;
  late final LoggerService _logger;

  static final NetworkHandler _instance = NetworkHandler._internal();

  factory NetworkHandler() {
    return _instance;
  }

  NetworkHandler._internal() {
    _logger = GetIt.I<LoggerService>();
    _initializeDio();
  }

  void _initializeDio() {
    final pawaPayJwt = dotenv.env['PAWAPAY_JWT'];
    final environment = dotenv.env['PAWAPAY_ENV'] ?? 'development';

    final baseUrl = environment.toLowerCase() == 'production'
        ? Constants.urls[Constants.pawapayProdUrl]
        : Constants.urls[Constants.pawapaySandboxUrl];

    _logger.info('CONFIGURATION: ${jsonEncode({
      'pawaPayJwt': pawaPayJwt,
      'environment': environment,
      'baseURL': baseUrl,
    })}');

    final headers = <String, dynamic>{};

    if (pawaPayJwt != null) {
      headers['Authorization'] = 'Bearer $pawaPayJwt';
    }

    _dio = Dio(BaseOptions(
      baseUrl: baseUrl!,
      headers: headers,
    ));

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));

    _setupInterceptors();
  }

  static void register() {
    GetIt.I.registerLazySingleton<NetworkHandler>(() => NetworkHandler());
  }

  Dio getInstance() {
    return _dio;
  }

  PawaPayNetworkResponse handleErrors(dynamic error) {
    _logger.severe('Error occurred: $error');

    String errorMessage = 'An unknown error occurred';
    int statusCode = 500;
    String errorObject = '{}';

    if (error is DioException && error.response != null) {
      statusCode = error.response!.statusCode ?? 500;

      try {
        final data = error.response!.data as Map<String, dynamic>;
        errorMessage = data['message'] ?? data['error'] ?? errorMessage;
        errorObject = jsonEncode(data);
      } catch (_) {
        errorMessage = 'Failed to parse error response';
      }
    }

    return PawaPayNetworkResponse(
      errorMessage: errorMessage,
      statusCode: statusCode,
      errorObject: errorObject,
    );
  }

  void _setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        _logger.info('Sending request: ${options.method} ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        _logger.info('Received response: ${response.statusCode}');
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        _logger.severe('Request error: ${error.message}');
        return handler.reject(error);
      },
    ));
  }
}