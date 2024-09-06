import 'package:get_it/get_it.dart';
import 'package:pawapay_flutter/core/utils/network_handler.dart';
import 'package:pawapay_flutter/core/utils/logger_service.dart';

import '../core/models/payment_data.dart';

class PaymentsPage {
  final NetworkHandler _networkHandler;
  final LoggerService _logger;
  final String _baseEndpoint;

  PaymentsPage({
    required NetworkHandler networkHandler,
  })  : _networkHandler = networkHandler,
        _logger = GetIt.I<LoggerService>(),
        _baseEndpoint = 'v1/widget/sessions';

  /// Initiates a payment process by sending payment data to v1/widget/sessions.
  /// This method constructs the payment request and handles the response, returning
  /// a URL to which the user can be redirected to complete the payment process.
  ///
  /// [paymentData] An object containing all necessary data for initiating the payment.
  /// The `PaymentData` object should include:
  /// - `depositId`: The ID of the deposit.
  /// - `price`: The amount of the payment.
  /// - `returnUrl`: The URL to which the user will be redirected after payment completion (can be specified in `.env` as `RETURN_URL`).
  /// - `basePaymentCountryIso`: ISO country code representing the base country for the payment.
  /// - `reason`: A text description of the reason for the payment.
  ///
  /// Returns a `Future` that resolves to an object containing
  /// the `redirectUrl` for the payment completion if successful, and an `error` flag set to `false`.
  /// In case of failure, it returns a `PawaPayNetworkResponse`.
  ///
  /// Throws an error if the request fails for reasons such as network issues,
  /// invalid payment data, or server errors.
  Future<dynamic> initiatePayment(PaymentData paymentData) async {
    try {
      final response = await _networkHandler.getInstance().post(
        _baseEndpoint,
        data: {
          'depositId': paymentData.depositId,
          'amount': paymentData.price.toString(),
          'returnUrl': paymentData.returnUrl,
          'country': paymentData.basePaymentCountryIso,
          'reason': paymentData.reason,
        },
      );

      _logger.info(
          'Sending payment initiation request for deposit: ${paymentData.depositId} with amount: ${paymentData.price}');

      return InitiatePaymentResponse(
        redirectUrl: response.data['redirectUrl'],
        error: false,
      );
    } catch (error) {
      _logger.severe('Payment initiation failed: $error');
      return _networkHandler.handleErrors(error);
    }
  }
}

void setupPaymentsPage() {
  GetIt.I.registerSingleton<PaymentsPage>(
    PaymentsPage(
      networkHandler: GetIt.I<NetworkHandler>(),
    ),
  );
}
