import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pawapay_flutter/pawapay_flutter.dart';
import 'package:get_it/get_it.dart';

@GenerateMocks([NetworkHandler, PawapayBaseService, LoggerService])
import 'pawapay_flutter_test.mocks.dart';

void main() {
  late MockNetworkHandler mockNetworkHandler;
  late MockPawapayBaseService mockPawapayBaseService;
  late MockLoggerService mockLoggerService;

  setUp(() {
    mockNetworkHandler = MockNetworkHandler();
    mockPawapayBaseService = MockPawapayBaseService();
    mockLoggerService = MockLoggerService();

    // Register mocks with GetIt
    GetIt.I.registerSingleton<NetworkHandler>(mockNetworkHandler);
    GetIt.I.registerSingleton<PawapayBaseService>(mockPawapayBaseService);
    GetIt.I.registerFactoryParam<LoggerService, String, void>(
      (name, _) => mockLoggerService,
    );

    // Initialize the library
    initializePawaPay();
  });

  tearDown(() {
    GetIt.I.reset();
  });

  group('PaymentsPage Tests', () {
    test('initiatePayment success', () async {
      final paymentsPage = GetIt.I<PaymentsPage>();
      final paymentData = PaymentData(
        depositId: '123',
        price: 100,
        returnUrl: 'https://example.com',
        basePaymentCountryIso: 'US',
        reason: 'Test payment',
        title: 'Test payment',
        currency: 'MWK',
      );

      when(mockNetworkHandler.getInstance()).thenReturn(MockDio());
      when(mockNetworkHandler.getInstance().post(any, data: anyNamed('data')))
          .thenAnswer((_) async => MockResponse());

      final result = await paymentsPage.initiatePayment(paymentData);

      expect(result, isA<InitiatePaymentResponse>());
      verify(mockNetworkHandler.getInstance().post(any, data: anyNamed('data')))
          .called(1);
    });

    // Add more tests for PaymentsPage...
  });

  group('Payouts Tests', () {
    test('sendPayout success', () async {
      final payouts = GetIt.I<Payouts>();
      final transaction = PayoutTransaction(
        phoneNumber: '1234567890',
        amount: '100',
        payoutId: '123',
        currency: MoMoCurrency.CDF,
        correspondent: Correspondent.MTN_MOMO_UGA,
        statementDescription: 'Test payout',
        country: 'UG',
      );

      when(mockPawapayBaseService.formatPhoneNumber(any))
          .thenReturn('1234567890');
      when(mockNetworkHandler.getInstance()).thenReturn(MockDio());
      when(mockNetworkHandler.getInstance().post(any, data: anyNamed('data')))
          .thenAnswer((_) async => MockResponse());

      final result = await payouts.sendPayout(transaction);

      expect(result, isA<PawaPayPayoutTransaction>());
      verify(mockNetworkHandler.getInstance().post(any, data: anyNamed('data')))
          .called(1);
    });

    // Add more tests for Payouts...
  });

  group('Refunds Tests', () {
    test('createRefundRequest success', () async {
      final refunds = GetIt.I<Refunds>();
      final refundData = {
        'refundId': '123',
        'depositId': '456',
      };

      when(mockNetworkHandler.getInstance()).thenReturn(MockDio());
      when(mockNetworkHandler.getInstance().post(any, data: anyNamed('data')))
          .thenAnswer((_) async => MockResponse());

      final result = await refunds.createRefundRequest(refundData);

      expect(result, isA<RefundResponse>());
      verify(mockNetworkHandler.getInstance().post(any, data: anyNamed('data')))
          .called(1);
    });

    // Add more tests for Refunds...
  });
}

// Mock classes for Dio and Response
class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response<dynamic> {}
