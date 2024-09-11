import 'package:get_it/get_it.dart';
import 'package:pawapay_flutter/core/utils/network_handler.dart';

import '../core/models/payment_models.dart';
import '../core/utils/pawapay_base_service.dart';

class Deposits {
  final NetworkHandler _networkHandler;
  final PawapayBaseService _pawapayBaseService;
  final String _baseEndpoint = '/deposits';

  Deposits({
    required NetworkHandler networkHandler,
    required PawapayBaseService pawapayBaseService,
  })  : _networkHandler = networkHandler,
        _pawapayBaseService = pawapayBaseService;

  Future<dynamic> sendDeposit(PayoutTransaction transaction) async {
    try {
      final phoneNumber =
          _pawapayBaseService.formatPhoneNumber(transaction.phoneNumber);

      print(
          'Sending payment to $phoneNumber the amount of ${transaction.amount} '
          'with payoutId ${transaction.payoutId} and currency ${transaction.currency}');

      final response = await _networkHandler.getInstance().post(
        _baseEndpoint,
        data: {
          'payoutId': transaction.payoutId,
          'amount': transaction.amount.toString(),
          'currency': transaction.currency.toString(),
          'correspondent': transaction.correspondent.toString(),
          'recipient': {
            'type': 'MSISDN',
            'address': {
              'value': _pawapayBaseService.formatPhoneNumber(phoneNumber)
            }
          },
          'customerTimestamp': DateTime.now().toIso8601String(),
          'statementDescription': transaction.statementDescription
        },
      );

      print('Payout transaction successful: ${response.data}');

      return response.data as PawaPayPayoutTransaction;
    } catch (error) {
      print('Payout transaction failed: $error');
      return _networkHandler.handleErrors(error);
    }
  }

  Future<dynamic> getDeposit(String depositId) async {
    try {
      final endpoint = '$_baseEndpoint/$depositId';
      final response = await _networkHandler.getInstance().get(endpoint);

      print('Deposit details retrieved successfully: ${response.data}');

      return response.data as List<PaymentTransaction>;
    } catch (error) {
      print('Failed to retrieve deposit details: $error');
      return _networkHandler.handleErrors(error);
    }
  }

  Future<dynamic> resendCallback(String depositId) async {
    try {
      final response = await _networkHandler.getInstance().post(
        '/deposits/resend-callback',
        data: {'depositId': depositId},
      );

      print('Callback resent successfully: ${response.data}');

      return response.data as ResendCallbackResponse;
    } catch (error) {
      print('Failed to resend callback: $error');
      return _networkHandler.handleErrors(error);
    }
  }
}

void setupDepositService() {
  GetIt.I.registerSingleton<Deposits>(
    Deposits(
      networkHandler: GetIt.I<NetworkHandler>(),
      pawapayBaseService: GetIt.I<PawapayBaseService>(),
    ),
  );
}
