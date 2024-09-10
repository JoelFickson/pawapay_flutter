library pawapay_flutter;

import 'package:pawapay_flutter/setup.dart';

// Export the models
export 'core/models/pawapay_network_response.dart';
export 'core/models/payment_models.dart';
export 'core/models/payment_data.dart';

// Export the services
export 'services/payments_page.dart';
export 'services/payouts_service.dart';
export 'services/refund_service.dart';

// Export the utilities
export 'core/utils/logger_service.dart';
export 'core/utils/network_handler.dart';
export 'core/utils/pawapay_base_service.dart';

// Export buttons
export 'ui/payment_buttons.dart';

/// Initializes all PawaPay services.
///
/// This function should be called before using any of the PawaPay services.
/// It sets up the dependency injection and initializes all necessary services.
void initializePawaPay() {
  setupLoggerService();
  setupNetworkHandler();
  setupPawapayBaseService();
  setupPaymentsPage();
  setupPayoutsService();
  setupRefundsService();
}
