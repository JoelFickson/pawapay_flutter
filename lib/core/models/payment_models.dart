import 'package:json_annotation/json_annotation.dart';

part 'payment_models.g.dart';

enum MoMoCurrency {
  XOF, XAF, CDF, GHS, KES, MWK, MZN, NGN, RWF, SLE, TZS, UGX, ZMW
}

enum Correspondent {
  MTN_MOMO_BEN, MOOV_BEN, MTN_MOMO_CMR, ORANGE_CMR, MTN_MOMO_CIV, ORANGE_CIV,
  VODACOM_MPESA_COD, AIRTEL_COD, ORANGE_COD, MTN_MOMO_GHA, AIRTELTIGO_GHA,
  VODAFONE_GHA, MPESA_KEN, AIRTEL_MWI, TNM_MWI, VODACOM_MOZ, AIRTEL_NGA,
  MTN_MOMO_NGA, AIRTEL_RWA, MTN_MOMO_RWA, FREE_SEN, ORANGE_SEN, ORANGE_SLE,
  AIRTEL_TZA, VODACOM_TZA, TIGO_TZA, HALOTEL_TZA, AIRTEL_OAPI_UGA, MTN_MOMO_UGA,
  AIRTEL_OAPI_ZMB, MTN_MOMO_ZMB, ZAMTEL_ZMB
}

enum PaymentStatus { PENDING, COMPLETED, FAILED, CANCELLED }

enum PayoutStatus { ACCEPTED, ENQUEUED, REJECTED, DUPLICATE_IGNORED }

enum ResendCallbackResponseStatus { ACCEPTED, REJECTED, FAILED }

@JsonSerializable()
class PaymentTransaction {
  final String depositId;
  final PaymentStatus status;
  final String requestedAmount;
  final String depositedAmount;
  final MoMoCurrency currency;
  final String country;
  final Payer payer;
  final Correspondent correspondent;
  final String statementDescription;
  final String customerTimestamp;
  final String created;
  final String respondedByPayer;
  final Map<String, String> correspondentIds;
  final List<SuspiciousActivityReport>? suspiciousActivityReport;

  PaymentTransaction({
    required this.depositId,
    required this.status,
    required this.requestedAmount,
    required this.depositedAmount,
    required this.currency,
    required this.country,
    required this.payer,
    required this.correspondent,
    required this.statementDescription,
    required this.customerTimestamp,
    required this.created,
    required this.respondedByPayer,
    required this.correspondentIds,
    this.suspiciousActivityReport,
  });

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) =>
      _$PaymentTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTransactionToJson(this);
}

@JsonSerializable()
class Payer {
  final String type;
  final PayerAddress address;

  Payer({required this.type, required this.address});

  factory Payer.fromJson(Map<String, dynamic> json) => _$PayerFromJson(json);

  Map<String, dynamic> toJson() => _$PayerToJson(this);
}

@JsonSerializable()
class PayerAddress {
  final String value;

  PayerAddress({required this.value});

  factory PayerAddress.fromJson(Map<String, dynamic> json) =>
      _$PayerAddressFromJson(json);

  Map<String, dynamic> toJson() => _$PayerAddressToJson(this);
}

@JsonSerializable()
class SuspiciousActivityReport {
  final String activityType;
  final String comment;

  SuspiciousActivityReport({required this.activityType, required this.comment});

  factory SuspiciousActivityReport.fromJson(Map<String, dynamic> json) =>
      _$SuspiciousActivityReportFromJson(json);

  Map<String, dynamic> toJson() => _$SuspiciousActivityReportToJson(this);
}

@JsonSerializable()
class CompletedTransaction extends PaymentTransaction {
  CompletedTransaction({
    required super.depositId,
    required super.requestedAmount,
    required super.depositedAmount,
    required super.currency,
    required super.country,
    required super.payer,
    required super.correspondent,
    required super.statementDescription,
    required super.customerTimestamp,
    required super.created,
    required super.respondedByPayer,
    required super.correspondentIds,
    super.suspiciousActivityReport,
  }) : super(status: PaymentStatus.COMPLETED);

  factory CompletedTransaction.fromJson(Map<String, dynamic> json) =>
      _$CompletedTransactionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CompletedTransactionToJson(this);
}

@JsonSerializable()
class AcceptedTransaction {
  final String depositId;
  final PaymentStatus status;
  final String requestedAmount;
  final MoMoCurrency currency;
  final String country;
  final Payer payer;
  final Correspondent correspondent;
  final String statementDescription;
  final String customerTimestamp;
  final String created;

  AcceptedTransaction({
    required this.depositId,
    required this.requestedAmount,
    required this.currency,
    required this.country,
    required this.payer,
    required this.correspondent,
    required this.statementDescription,
    required this.customerTimestamp,
    required this.created,
  }) : status = PaymentStatus.PENDING;

  factory AcceptedTransaction.fromJson(Map<String, dynamic> json) =>
      _$AcceptedTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptedTransactionToJson(this);
}

@JsonSerializable()
class SubmittedTransaction {
  final String depositId;
  final PaymentStatus status;
  final String requestedAmount;
  final MoMoCurrency currency;
  final String country;
  final Payer payer;
  final Correspondent correspondent;
  final String statementDescription;
  final String customerTimestamp;
  final String created;

  SubmittedTransaction({
    required this.depositId,
    required this.requestedAmount,
    required this.currency,
    required this.country,
    required this.payer,
    required this.correspondent,
    required this.statementDescription,
    required this.customerTimestamp,
    required this.created,
  }) : status = PaymentStatus.PENDING;

  factory SubmittedTransaction.fromJson(Map<String, dynamic> json) =>
      _$SubmittedTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$SubmittedTransactionToJson(this);
}

@JsonSerializable()
class FailedTransaction {
  final String depositId;
  final PaymentStatus status;
  final String requestedAmount;
  final String depositedAmount;
  final MoMoCurrency currency;
  final String country;
  final Payer payer;
  final Correspondent correspondent;
  final String statementDescription;
  final String customerTimestamp;
  final String created;
  final String respondedByPayer;
  final Map<String, String> correspondentIds;
  final FailureReason failureReason;

  FailedTransaction({
    required this.depositId,
    required this.requestedAmount,
    required this.depositedAmount,
    required this.currency,
    required this.country,
    required this.payer,
    required this.correspondent,
    required this.statementDescription,
    required this.customerTimestamp,
    required this.created,
    required this.respondedByPayer,
    required this.correspondentIds,
    required this.failureReason,
  }) : status = PaymentStatus.FAILED;

  factory FailedTransaction.fromJson(Map<String, dynamic> json) =>
      _$FailedTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$FailedTransactionToJson(this);
}

@JsonSerializable()
class FailureReason {
  final String failureCode;
  final String failureMessage;

  FailureReason({required this.failureCode, required this.failureMessage});

  factory FailureReason.fromJson(Map<String, dynamic> json) =>
      _$FailureReasonFromJson(json);

  Map<String, dynamic> toJson() => _$FailureReasonToJson(this);
}

@JsonSerializable()
class PawaPayPayoutTransaction {
  final String payoutId;
  final PayoutStatus status;
  final String created;

  PawaPayPayoutTransaction({
    required this.payoutId,
    required this.status,
    required this.created,
  });

  factory PawaPayPayoutTransaction.fromJson(Map<String, dynamic> json) =>
      _$PawaPayPayoutTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$PawaPayPayoutTransactionToJson(this);
}

@JsonSerializable()
class PayoutTransaction {
  final String amount;
  final String phoneNumber;
  final String payoutId;
  final MoMoCurrency currency;
  final Correspondent correspondent;
  final String statementDescription;
  final String country;
  final String? customerTimestamp;

  PayoutTransaction({
    required this.amount,
    required this.phoneNumber,
    required this.payoutId,
    required this.currency,
    required this.correspondent,
    required this.statementDescription,
    required this.country,
    this.customerTimestamp,
  });

  factory PayoutTransaction.fromJson(Map<String, dynamic> json) =>
      _$PayoutTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$PayoutTransactionToJson(this);
}

@JsonSerializable()
class ResendCallbackResponse {
  final String payoutId;
  final ResendCallbackResponseStatus status;
  final String? rejectionReason;

  ResendCallbackResponse({
    required this.payoutId,
    required this.status,
    this.rejectionReason,
  });

  factory ResendCallbackResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendCallbackResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResendCallbackResponseToJson(this);
}

@JsonSerializable()
class RefundResponse {
  final String refundId;
  final String status;
  final DateTime? created;
  final RefundRejectionReason? rejectionReason;

  RefundResponse({
    required this.refundId,
    required this.status,
    this.created,
    this.rejectionReason,
  });

  factory RefundResponse.fromJson(Map<String, dynamic> json) =>
      _$RefundResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefundResponseToJson(this);
}

@JsonSerializable()
class RefundRejectionReason {
  final String rejectionCode;
  final String rejectionMessage;

  RefundRejectionReason({
    required this.rejectionCode,
    required this.rejectionMessage,
  });

  factory RefundRejectionReason.fromJson(Map<String, dynamic> json) =>
      _$RefundRejectionReasonFromJson(json);

  Map<String, dynamic> toJson() => _$RefundRejectionReasonToJson(this);
}

@JsonSerializable()
class RefundTransaction {
  final String refundId;
  final String status;
  final String amount;
  final MoMoCurrency currency;
  final String country;
  final Correspondent correspondent;
  final Payer recipient;
  final String customerTimestamp;
  final String? statementDescription;
  final String created;
  final String? receivedByRecipient;
  final Map<String, String>? correspondentIds;
  final RefundFailureReason? failureReason;

  RefundTransaction({
    required this.refundId,
    required this.status,
    required this.amount,
    required this.currency,
    required this.country,
    required this.correspondent,
    required this.recipient,
    required this.customerTimestamp,
    this.statementDescription,
    required this.created,
    this.receivedByRecipient,
    this.correspondentIds,
    this.failureReason,
  });

  factory RefundTransaction.fromJson(Map<String, dynamic> json) =>
      _$RefundTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$RefundTransactionToJson(this);
}

@JsonSerializable()
class RefundFailureReason {
  final String failureCode;
  final String failureMessage;

  RefundFailureReason({
    required this.failureCode,
    required this.failureMessage,
  });

  factory RefundFailureReason.fromJson(Map<String, dynamic> json) =>
      _$RefundFailureReasonFromJson(json);

  Map<String, dynamic> toJson() => _$RefundFailureReasonToJson(this);
}