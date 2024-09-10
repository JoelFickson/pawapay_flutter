import 'package:get_it/get_it.dart';
import 'package:pawapay_flutter/services/payouts_service.dart';
import 'package:pawapay_flutter/services/refund_service.dart';
import 'core/utils/network_handler.dart';
import 'core/utils/pawapay_base_service.dart';
import 'services/payments_page.dart';

void setupNetworkHandler() {
  NetworkHandler.register();
}

void setupPawapayBaseService() {
  PawapayBaseService.register();
}

void setupPaymentsPage() {
  GetIt.I.registerSingleton<PaymentsPage>(
    PaymentsPage(
      networkHandler: GetIt.I<NetworkHandler>(),
    ),
  );
}

void setupPayoutsService() {
  GetIt.I.registerSingleton<Payouts>(
    Payouts(
      networkHandler: GetIt.I<NetworkHandler>(),
      pawapayBaseService: GetIt.I<PawapayBaseService>(),
    ),
  );
}

void setupRefundsService() {
  GetIt.I.registerSingleton<Refunds>(
    Refunds(
      networkHandler: GetIt.I<NetworkHandler>(),
    ),
  );
}
