import 'package:get_it/get_it.dart';
import 'package:pawapay_flutter/core/utils/network_handler.dart';
import 'package:pawapay_flutter/core/utils/pawapay_base_service.dart';
import 'package:pawapay_flutter/core/utils/logger_service.dart';
import 'package:pawapay_flutter/core/models/payment_models.dart';

class Payouts {
  final NetworkHandler _networkHandler;
  final PawapayBaseService _pawapayBaseService;
  final LoggerService _logger;
  final String _baseEndpoint;

  Payouts({
    required NetworkHandler networkHandler,
    required PawapayBaseService pawapayBaseService,
  })  : _networkHandler = networkHandler,
        _pawapayBaseService = pawapayBaseService,
        _logger = GetIt.I<LoggerService>(),
        _baseEndpoint = '/payouts';

  /// Sends a payout transaction to the specified endpoint, processing the transaction
  /// details provided in the [transaction] parameter. It formats the phone number,
  /// logs the transaction details for debugging, and handles the server response.
  ///
  /// [transaction] The payout transaction object containing all the necessary information
  /// for processing the payout. This includes:
  ///  - `phoneNumber`: The recipient's phone number.
  ///  - `amount`: The payout amount.
  ///  - `payoutId`: A unique identifier for the payout.
  ///  - `currency`: The currency code for the amount (e.g., USD, GBP).
  ///  - `correspondent`: The correspondent code for the transaction.
  ///  - `statementDescription`: A description for the statement.
  ///
  /// Returns a `Future` that resolves to the payout transaction response object
  /// if the request is successful. The object includes all relevant details about the transaction response from the server.
  /// In the case of an error, it returns a `PawaPayNetworkResponse`.
  Future<dynamic> sendPayout(PayoutTransaction transaction) async {
    try {
      final phoneNumber =
          _pawapayBaseService.formatPhoneNumber(transaction.phoneNumber);

      _logger.info(
          'Sending payout to $phoneNumber the amount of ${transaction.amount} '
          'with payoutId ${transaction.payoutId} and currency ${transaction.currency}');

      final response = await _networkHandler.getInstance().post(
        _baseEndpoint,
        data: {
          'payoutId': transaction.payoutId,
          'amount': transaction.amount.toString(),
          'currency': transaction.currency,
          'correspondent': transaction.correspondent,
          'recipient': {
            'type': 'MSISDN',
            'address': {'value': phoneNumber}
          },
          'customerTimestamp': DateTime.now().toIso8601String(),
          'statementDescription': transaction.statementDescription
        },
      );

      _logger.info('Payout transaction successful: ${response.data}');

      return response.data as PawaPayPayoutTransaction;
    } catch (error) {
      _logger.severe('Payout transaction failed: $error');
      return _networkHandler.handleErrors(error);
    }
  }

  /// Asynchronously processes a bulk payout transaction request by sending multiple payout transactions to the PawaPay service.
  /// Each transaction is formatted according to the requirements before sending. This method is useful for processing multiple
  /// payouts in a single operation, improving efficiency and reducing the number of individual requests.
  ///
  /// [transactions] An array of `PayoutTransaction` objects representing the individual transactions to be processed in bulk.
  ///
  /// Returns a `Future` that resolves to a list of `PawaPayPayoutTransaction` objects if the bulk payout is successfully processed.
  /// Each object in the list represents the response for the corresponding payout transaction. If an error occurs during the process,
  /// it returns a `PawaPayNetworkResponse`.
  Future<dynamic> sendBulkPayout(List<PayoutTransaction> transactions) async {
    try {
      final formattedTransactions = transactions
          .map((transaction) => {
                'payoutId': transaction.payoutId,
                'amount': transaction.amount.toString(),
                'currency': transaction.currency,
                'correspondent': transaction.correspondent,
                'recipient': {
                  'type': 'MSISDN',
                  'address': {
                    'value': _pawapayBaseService
                        .formatPhoneNumber(transaction.phoneNumber)
                  }
                },
                'customerTimestamp': DateTime.now().toIso8601String(),
                'statementDescription': transaction.statementDescription
              })
          .toList();

      final response = await _networkHandler.getInstance().post(
        _baseEndpoint,
        data: {'formattedTransactions': formattedTransactions},
      );

      _logger.info('Bulk payout transaction successful: ${response.data}');

      return response.data as List<PawaPayPayoutTransaction>;
    } catch (error) {
      _logger.severe('Bulk payout transaction failed: $error');
      return _networkHandler.handleErrors(error);
    }
  }

  /// Asynchronously retrieves the details of a specific payout transaction by its unique identifier (depositId).
  /// This method constructs the request URL using the depositId and makes a GET request to the PawaPay service endpoint
  /// to obtain the transaction details. It is designed to fetch information for individual payout transactions.
  ///
  /// [depositId] The unique identifier for the payout transaction whose details are being retrieved.
  ///
  /// Returns a `Future` that resolves to a `PawaPayPayoutTransaction` object if the payout details are successfully retrieved.
  /// This object contains the details of the specified payout transaction. If an error occurs during the retrieval process,
  /// it returns a `PawaPayNetworkResponse`.
  Future<dynamic> getPayout(String depositId) async {
    try {
      final response =
          await _networkHandler.getInstance().get('$_baseEndpoint/$depositId');

      _logger.info('Payout details retrieved successfully: ${response.data}');

      return response.data as PawaPayPayoutTransaction;
    } catch (error) {
      _logger.severe('Failed to retrieve payout details: $error');
      return _networkHandler.handleErrors(error);
    }
  }
}

void setupPayoutsService() {
  GetIt.I.registerSingleton<Payouts>(
    Payouts(
      networkHandler: GetIt.I<NetworkHandler>(),
      pawapayBaseService: GetIt.I<PawapayBaseService>(),
    ),
  );
}
