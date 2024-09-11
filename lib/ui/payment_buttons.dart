import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pawapay_flutter/services/deposits_service.dart';
import '../core/models/payment_models.dart';

class PawaPayPaymentButton extends StatelessWidget {
  final double amount;
  final MoMoCurrency currency;
  final String phoneNumber;
  final String payoutId;
  final Correspondent correspondent;
  final String statementDescription;
  final Function(dynamic)? onPaymentResult;
  final ButtonStyle? style;

  const PawaPayPaymentButton({
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
    } catch (error) {
      if (onPaymentResult != null) {
        onPaymentResult!(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: () => _handlePayment(context),
      child: Text('Pay ${currency.code} $amount'),
    );
  }
}