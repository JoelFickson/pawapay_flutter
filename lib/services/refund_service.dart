import 'package:get_it/get_it.dart';
import 'package:pawapay_flutter/core/utils/network_handler.dart';
import 'package:pawapay_flutter/core/utils/logger_service.dart';
import 'package:pawapay_flutter/core/models/payment_models.dart';

class Refunds {
  final NetworkHandler _networkHandler;
  final LoggerService _logger;
  final String _baseEndpoint;

  Refunds({
    required NetworkHandler networkHandler,
  })  : _networkHandler = networkHandler,
        _logger = GetIt.I<LoggerService>(),
        _baseEndpoint = '/refunds';

  /// Asynchronously submits a request to create a refund for a specific transaction. This method sends the refund details,
  /// including the unique identifiers for the refund and the original deposit, to a designated service endpoint for processing.
  /// It is intended to initiate the refund process for transactions that meet the criteria for refunding.
  ///
  /// [refundData] An object containing the refund request details. The structure of this object includes
  /// `refundId`, the unique identifier for the refund request, and `depositId`, the unique identifier of the original deposit transaction to be refunded.
  ///
  /// Returns a `Future` that resolves to a `RefundResponse` object if the refund request is successfully processed.
  /// The `RefundResponse` type should detail the outcome of the refund request. In case of an error during the request processing,
  /// it returns a `PawaPayNetworkResponse`.
  Future<dynamic> createRefundRequest(Map<String, dynamic> refundData) async {
    try {
      final response = await _networkHandler.getInstance().post(
        _baseEndpoint,
        data: {
          'refundId': refundData['refundId'],
          'depositId': refundData['depositId'],
        },
      );

      _logger.info(
          'Sending refund request for deposit: ${refundData['depositId']} with refundId: ${refundData['refundId']}');

      return response.data as RefundResponse;
    } catch (error) {
      _logger.severe('Refund request failed: $error');
      return _networkHandler.handleErrors(error);
    }
  }

  /// Asynchronously retrieves the status of a specific refund transaction by its unique identifier (refundId).
  /// This method constructs the request URL using the refundId and makes a GET request to the service endpoint
  /// to fetch the current status of the refund transaction. It provides a means to track the progress or outcome of refund requests.
  ///
  /// [refundId] The unique identifier for the refund transaction whose status is being queried.
  ///
  /// Returns a `Future` that resolves to a `RefundTransaction` object if the refund status is successfully retrieved.
  /// The `RefundTransaction` type is expected to contain comprehensive details about the refund transaction, including its current status.
  /// If an error occurs during the retrieval process, it returns a `PawaPayNetworkResponse`.
  Future<dynamic> getRefundStatus(String refundId) async {
    try {
      final endpoint = '$_baseEndpoint/$refundId';
      final response = await _networkHandler.getInstance().get(endpoint);

      _logger.info('Refund details retrieved successfully: ${response.data}');

      return response.data as RefundTransaction;
    } catch (error) {
      _logger.severe('Failed to retrieve refund status: $error');
      return _networkHandler.handleErrors(error);
    }
  }
}

void setupRefundsService() {
  GetIt.I.registerSingleton<Refunds>(
    Refunds(
      networkHandler: GetIt.I<NetworkHandler>(),
    ),
  );
}
