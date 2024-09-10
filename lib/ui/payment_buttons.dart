import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pawapay_flutter/services/deposits_service.dart';
import '../core/models/payment_models.dart';

class PaymentButton extends StatelessWidget {
  final double amount;
  final MoMoCurrency currency;
  final String phoneNumber;
  final String payoutId;
  final Correspondent correspondent;
  final String statementDescription;
  final Function(dynamic)? onPaymentResult;
  final ButtonStyle? style;

  const PaymentButton({
    super.key,
    required this.amount,
    required this.currency,
    required this.phoneNumber,
    required this.payoutId,
    required this.correspondent,
    required this.statementDescription,
    this.onPaymentResult,
    this.style,
  });

  void _handlePayment(BuildContext context) async {
    final deposits = GetIt.I<Deposits>();

    final transaction = PayoutTransaction(
      amount: amount.toString(),
      currency: currency,
      phoneNumber: phoneNumber,
      payoutId: payoutId,
      correspondent: correspondent,
      statementDescription: statementDescription,
      country: '',
    );

    try {
      final result = await deposits.sendDeposit(transaction);

      if (onPaymentResult != null) {
        onPaymentResult!(result);
      }

      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Payment Successful'),
              content:
                  Text('Your payment of $currency $amount was successful.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      if (onPaymentResult != null) {
        onPaymentResult!(error);
      }

      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Payment Failed'),
              content: Text(
                  'Your payment of $currency $amount failed. Error: $error'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: () => _handlePayment(context),
      child: Text('Pay $currency $amount'),
    );
  }
}
