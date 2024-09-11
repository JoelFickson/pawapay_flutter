import 'package:flutter/material.dart';
import 'package:pawapay_flutter/pawapay_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Your Payment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PawaPayPaymentButton(
            amount: 100.0,
            currency: MoMoCurrency.MWK,
            phoneNumber: '265883456789',
            payoutId: '123456789',
            correspondent: Correspondent.TNM_MWI,
            statementDescription: 'Payment for a service',
            onPaymentResult: (result) {
              print(result.toString());
            },
          ),
        ],
      ),
    );
  }
}
