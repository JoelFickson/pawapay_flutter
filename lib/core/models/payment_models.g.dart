// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentTransaction _$PaymentTransactionFromJson(Map<String, dynamic> json) =>
    PaymentTransaction(
      depositId: json['depositId'] as String,
      status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
      requestedAmount: json['requestedAmount'] as String,
      depositedAmount: json['depositedAmount'] as String,
      currency: $enumDecode(_$MoMoCurrencyEnumMap, json['currency']),
      country: json['country'] as String,
      payer: Payer.fromJson(json['payer'] as Map<String, dynamic>),
      correspondent: $enumDecode(_$CorrespondentEnumMap, json['correspondent']),
      statementDescription: json['statementDescription'] as String,
      customerTimestamp: json['customerTimestamp'] as String,
      created: json['created'] as String,
      respondedByPayer: json['respondedByPayer'] as String,
      correspondentIds:
          Map<String, String>.from(json['correspondentIds'] as Map),
      suspiciousActivityReport:
          (json['suspiciousActivityReport'] as List<dynamic>?)
              ?.map((e) =>
                  SuspiciousActivityReport.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$PaymentTransactionToJson(PaymentTransaction instance) =>
    <String, dynamic>{
      'depositId': instance.depositId,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'requestedAmount': instance.requestedAmount,
      'depositedAmount': instance.depositedAmount,
      'currency': _$MoMoCurrencyEnumMap[instance.currency]!,
      'country': instance.country,
      'payer': instance.payer,
      'correspondent': _$CorrespondentEnumMap[instance.correspondent]!,
      'statementDescription': instance.statementDescription,
      'customerTimestamp': instance.customerTimestamp,
      'created': instance.created,
      'respondedByPayer': instance.respondedByPayer,
      'correspondentIds': instance.correspondentIds,
      'suspiciousActivityReport': instance.suspiciousActivityReport,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.PENDING: 'PENDING',
  PaymentStatus.COMPLETED: 'COMPLETED',
  PaymentStatus.FAILED: 'FAILED',
  PaymentStatus.CANCELLED: 'CANCELLED',
};

const _$MoMoCurrencyEnumMap = {
  MoMoCurrency.XOF: 'XOF',
  MoMoCurrency.XAF: 'XAF',
  MoMoCurrency.CDF: 'CDF',
  MoMoCurrency.GHS: 'GHS',
  MoMoCurrency.KES: 'KES',
  MoMoCurrency.MWK: 'MWK',
  MoMoCurrency.MZN: 'MZN',
  MoMoCurrency.NGN: 'NGN',
  MoMoCurrency.RWF: 'RWF',
  MoMoCurrency.SLE: 'SLE',
  MoMoCurrency.TZS: 'TZS',
  MoMoCurrency.UGX: 'UGX',
  MoMoCurrency.ZMW: 'ZMW',
};

const _$CorrespondentEnumMap = {
  Correspondent.MTN_MOMO_BEN: 'MTN_MOMO_BEN',
  Correspondent.MOOV_BEN: 'MOOV_BEN',
  Correspondent.MTN_MOMO_CMR: 'MTN_MOMO_CMR',
  Correspondent.ORANGE_CMR: 'ORANGE_CMR',
  Correspondent.MTN_MOMO_CIV: 'MTN_MOMO_CIV',
  Correspondent.ORANGE_CIV: 'ORANGE_CIV',
  Correspondent.VODACOM_MPESA_COD: 'VODACOM_MPESA_COD',
  Correspondent.AIRTEL_COD: 'AIRTEL_COD',
  Correspondent.ORANGE_COD: 'ORANGE_COD',
  Correspondent.MTN_MOMO_GHA: 'MTN_MOMO_GHA',
  Correspondent.AIRTELTIGO_GHA: 'AIRTELTIGO_GHA',
  Correspondent.VODAFONE_GHA: 'VODAFONE_GHA',
  Correspondent.MPESA_KEN: 'MPESA_KEN',
  Correspondent.AIRTEL_MWI: 'AIRTEL_MWI',
  Correspondent.TNM_MWI: 'TNM_MWI',
  Correspondent.VODACOM_MOZ: 'VODACOM_MOZ',
  Correspondent.AIRTEL_NGA: 'AIRTEL_NGA',
  Correspondent.MTN_MOMO_NGA: 'MTN_MOMO_NGA',
  Correspondent.AIRTEL_RWA: 'AIRTEL_RWA',
  Correspondent.MTN_MOMO_RWA: 'MTN_MOMO_RWA',
  Correspondent.FREE_SEN: 'FREE_SEN',
  Correspondent.ORANGE_SEN: 'ORANGE_SEN',
  Correspondent.ORANGE_SLE: 'ORANGE_SLE',
  Correspondent.AIRTEL_TZA: 'AIRTEL_TZA',
  Correspondent.VODACOM_TZA: 'VODACOM_TZA',
  Correspondent.TIGO_TZA: 'TIGO_TZA',
  Correspondent.HALOTEL_TZA: 'HALOTEL_TZA',
  Correspondent.AIRTEL_OAPI_UGA: 'AIRTEL_OAPI_UGA',
  Correspondent.MTN_MOMO_UGA: 'MTN_MOMO_UGA',
  Correspondent.AIRTEL_OAPI_ZMB: 'AIRTEL_OAPI_ZMB',
  Correspondent.MTN_MOMO_ZMB: 'MTN_MOMO_ZMB',
  Correspondent.ZAMTEL_ZMB: 'ZAMTEL_ZMB',
};

Payer _$PayerFromJson(Map<String, dynamic> json) => Payer(
      type: json['type'] as String,
      address: PayerAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayerToJson(Payer instance) => <String, dynamic>{
      'type': instance.type,
      'address': instance.address,
    };

PayerAddress _$PayerAddressFromJson(Map<String, dynamic> json) => PayerAddress(
      value: json['value'] as String,
    );

Map<String, dynamic> _$PayerAddressToJson(PayerAddress instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

SuspiciousActivityReport _$SuspiciousActivityReportFromJson(
        Map<String, dynamic> json) =>
    SuspiciousActivityReport(
      activityType: json['activityType'] as String,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$SuspiciousActivityReportToJson(
        SuspiciousActivityReport instance) =>
    <String, dynamic>{
      'activityType': instance.activityType,
      'comment': instance.comment,
    };

CompletedTransaction _$CompletedTransactionFromJson(
        Map<String, dynamic> json) =>
    CompletedTransaction(
      depositId: json['depositId'] as String,
      requestedAmount: json['requestedAmount'] as String,
      depositedAmount: json['depositedAmount'] as String,
      currency: $enumDecode(_$MoMoCurrencyEnumMap, json['currency']),
      country: json['country'] as String,
      payer: Payer.fromJson(json['payer'] as Map<String, dynamic>),
      correspondent: $enumDecode(_$CorrespondentEnumMap, json['correspondent']),
      statementDescription: json['statementDescription'] as String,
      customerTimestamp: json['customerTimestamp'] as String,
      created: json['created'] as String,
      respondedByPayer: json['respondedByPayer'] as String,
      correspondentIds:
          Map<String, String>.from(json['correspondentIds'] as Map),
      suspiciousActivityReport:
          (json['suspiciousActivityReport'] as List<dynamic>?)
              ?.map((e) =>
                  SuspiciousActivityReport.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CompletedTransactionToJson(
        CompletedTransaction instance) =>
    <String, dynamic>{
      'depositId': instance.depositId,
      'requestedAmount': instance.requestedAmount,
      'depositedAmount': instance.depositedAmount,
      'currency': _$MoMoCurrencyEnumMap[instance.currency]!,
      'country': instance.country,
      'payer': instance.payer,
      'correspondent': _$CorrespondentEnumMap[instance.correspondent]!,
      'statementDescription': instance.statementDescription,
      'customerTimestamp': instance.customerTimestamp,
      'created': instance.created,
      'respondedByPayer': instance.respondedByPayer,
      'correspondentIds': instance.correspondentIds,
      'suspiciousActivityReport': instance.suspiciousActivityReport,
    };

AcceptedTransaction _$AcceptedTransactionFromJson(Map<String, dynamic> json) =>
    AcceptedTransaction(
      depositId: json['depositId'] as String,
      requestedAmount: json['requestedAmount'] as String,
      currency: $enumDecode(_$MoMoCurrencyEnumMap, json['currency']),
      country: json['country'] as String,
      payer: Payer.fromJson(json['payer'] as Map<String, dynamic>),
      correspondent: $enumDecode(_$CorrespondentEnumMap, json['correspondent']),
      statementDescription: json['statementDescription'] as String,
      customerTimestamp: json['customerTimestamp'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$AcceptedTransactionToJson(
        AcceptedTransaction instance) =>
    <String, dynamic>{
      'depositId': instance.depositId,
      'requestedAmount': instance.requestedAmount,
      'currency': _$MoMoCurrencyEnumMap[instance.currency]!,
      'country': instance.country,
      'payer': instance.payer,
      'correspondent': _$CorrespondentEnumMap[instance.correspondent]!,
      'statementDescription': instance.statementDescription,
      'customerTimestamp': instance.customerTimestamp,
      'created': instance.created,
    };

SubmittedTransaction _$SubmittedTransactionFromJson(
        Map<String, dynamic> json) =>
    SubmittedTransaction(
      depositId: json['depositId'] as String,
      requestedAmount: json['requestedAmount'] as String,
      currency: $enumDecode(_$MoMoCurrencyEnumMap, json['currency']),
      country: json['country'] as String,
      payer: Payer.fromJson(json['payer'] as Map<String, dynamic>),
      correspondent: $enumDecode(_$CorrespondentEnumMap, json['correspondent']),
      statementDescription: json['statementDescription'] as String,
      customerTimestamp: json['customerTimestamp'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$SubmittedTransactionToJson(
        SubmittedTransaction instance) =>
    <String, dynamic>{
      'depositId': instance.depositId,
      'requestedAmount': instance.requestedAmount,
      'currency': _$MoMoCurrencyEnumMap[instance.currency]!,
      'country': instance.country,
      'payer': instance.payer,
      'correspondent': _$CorrespondentEnumMap[instance.correspondent]!,
      'statementDescription': instance.statementDescription,
      'customerTimestamp': instance.customerTimestamp,
      'created': instance.created,
    };

FailedTransaction _$FailedTransactionFromJson(Map<String, dynamic> json) =>
    FailedTransaction(
      depositId: json['depositId'] as String,
      requestedAmount: json['requestedAmount'] as String,
      depositedAmount: json['depositedAmount'] as String,
      currency: $enumDecode(_$MoMoCurrencyEnumMap, json['currency']),
      country: json['country'] as String,
      payer: Payer.fromJson(json['payer'] as Map<String, dynamic>),
      correspondent: $enumDecode(_$CorrespondentEnumMap, json['correspondent']),
      statementDescription: json['statementDescription'] as String,
      customerTimestamp: json['customerTimestamp'] as String,
      created: json['created'] as String,
      respondedByPayer: json['respondedByPayer'] as String,
      correspondentIds:
          Map<String, String>.from(json['correspondentIds'] as Map),
      failureReason:
          FailureReason.fromJson(json['failureReason'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FailedTransactionToJson(FailedTransaction instance) =>
    <String, dynamic>{
      'depositId': instance.depositId,
      'requestedAmount': instance.requestedAmount,
      'depositedAmount': instance.depositedAmount,
      'currency': _$MoMoCurrencyEnumMap[instance.currency]!,
      'country': instance.country,
      'payer': instance.payer,
      'correspondent': _$CorrespondentEnumMap[instance.correspondent]!,
      'statementDescription': instance.statementDescription,
      'customerTimestamp': instance.customerTimestamp,
      'created': instance.created,
      'respondedByPayer': instance.respondedByPayer,
      'correspondentIds': instance.correspondentIds,
      'failureReason': instance.failureReason,
    };

FailureReason _$FailureReasonFromJson(Map<String, dynamic> json) =>
    FailureReason(
      failureCode: json['failureCode'] as String,
      failureMessage: json['failureMessage'] as String,
    );

Map<String, dynamic> _$FailureReasonToJson(FailureReason instance) =>
    <String, dynamic>{
      'failureCode': instance.failureCode,
      'failureMessage': instance.failureMessage,
    };

PawaPayPayoutTransaction _$PawaPayPayoutTransactionFromJson(
        Map<String, dynamic> json) =>
    PawaPayPayoutTransaction(
      payoutId: json['payoutId'] as String,
      status: $enumDecode(_$PayoutStatusEnumMap, json['status']),
      created: json['created'] as String,
    );

Map<String, dynamic> _$PawaPayPayoutTransactionToJson(
        PawaPayPayoutTransaction instance) =>
    <String, dynamic>{
      'payoutId': instance.payoutId,
      'status': _$PayoutStatusEnumMap[instance.status]!,
      'created': instance.created,
    };

const _$PayoutStatusEnumMap = {
  PayoutStatus.ACCEPTED: 'ACCEPTED',
  PayoutStatus.ENQUEUED: 'ENQUEUED',
  PayoutStatus.REJECTED: 'REJECTED',
  PayoutStatus.DUPLICATE_IGNORED: 'DUPLICATE_IGNORED',
};

PayoutTransaction _$PayoutTransactionFromJson(Map<String, dynamic> json) =>
    PayoutTransaction(
      amount: json['amount'] as String,
      phoneNumber: json['phoneNumber'] as String,
      payoutId: json['payoutId'] as String,
      currency: $enumDecode(_$MoMoCurrencyEnumMap, json['currency']),
      correspondent: $enumDecode(_$CorrespondentEnumMap, json['correspondent']),
      statementDescription: json['statementDescription'] as String,
      country: json['country'] as String,
      customerTimestamp: json['customerTimestamp'] as String?,
    );

Map<String, dynamic> _$PayoutTransactionToJson(PayoutTransaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'phoneNumber': instance.phoneNumber,
      'payoutId': instance.payoutId,
      'currency': _$MoMoCurrencyEnumMap[instance.currency]!,
      'correspondent': _$CorrespondentEnumMap[instance.correspondent]!,
      'statementDescription': instance.statementDescription,
      'country': instance.country,
      'customerTimestamp': instance.customerTimestamp,
    };

ResendCallbackResponse _$ResendCallbackResponseFromJson(
        Map<String, dynamic> json) =>
    ResendCallbackResponse(
      payoutId: json['payoutId'] as String,
      status:
          $enumDecode(_$ResendCallbackResponseStatusEnumMap, json['status']),
      rejectionReason: json['rejectionReason'] as String?,
    );

Map<String, dynamic> _$ResendCallbackResponseToJson(
        ResendCallbackResponse instance) =>
    <String, dynamic>{
      'payoutId': instance.payoutId,
      'status': _$ResendCallbackResponseStatusEnumMap[instance.status]!,
      'rejectionReason': instance.rejectionReason,
    };

const _$ResendCallbackResponseStatusEnumMap = {
  ResendCallbackResponseStatus.ACCEPTED: 'ACCEPTED',
  ResendCallbackResponseStatus.REJECTED: 'REJECTED',
  ResendCallbackResponseStatus.FAILED: 'FAILED',
};

RefundResponse _$RefundResponseFromJson(Map<String, dynamic> json) =>
    RefundResponse(
      refundId: json['refundId'] as String,
      status: json['status'] as String,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      rejectionReason: json['rejectionReason'] == null
          ? null
          : RefundRejectionReason.fromJson(
              json['rejectionReason'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefundResponseToJson(RefundResponse instance) =>
    <String, dynamic>{
      'refundId': instance.refundId,
      'status': instance.status,
      'created': instance.created?.toIso8601String(),
      'rejectionReason': instance.rejectionReason,
    };

RefundRejectionReason _$RefundRejectionReasonFromJson(
        Map<String, dynamic> json) =>
    RefundRejectionReason(
      rejectionCode: json['rejectionCode'] as String,
      rejectionMessage: json['rejectionMessage'] as String,
    );

Map<String, dynamic> _$RefundRejectionReasonToJson(
        RefundRejectionReason instance) =>
    <String, dynamic>{
      'rejectionCode': instance.rejectionCode,
      'rejectionMessage': instance.rejectionMessage,
    };

RefundTransaction _$RefundTransactionFromJson(Map<String, dynamic> json) =>
    RefundTransaction(
      refundId: json['refundId'] as String,
      status: json['status'] as String,
      amount: json['amount'] as String,
      currency: $enumDecode(_$MoMoCurrencyEnumMap, json['currency']),
      country: json['country'] as String,
      correspondent: $enumDecode(_$CorrespondentEnumMap, json['correspondent']),
      recipient: Payer.fromJson(json['recipient'] as Map<String, dynamic>),
      customerTimestamp: json['customerTimestamp'] as String,
      statementDescription: json['statementDescription'] as String?,
      created: json['created'] as String,
      receivedByRecipient: json['receivedByRecipient'] as String?,
      correspondentIds:
          (json['correspondentIds'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      failureReason: json['failureReason'] == null
          ? null
          : RefundFailureReason.fromJson(
              json['failureReason'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefundTransactionToJson(RefundTransaction instance) =>
    <String, dynamic>{
      'refundId': instance.refundId,
      'status': instance.status,
      'amount': instance.amount,
      'currency': _$MoMoCurrencyEnumMap[instance.currency]!,
      'country': instance.country,
      'correspondent': _$CorrespondentEnumMap[instance.correspondent]!,
      'recipient': instance.recipient,
      'customerTimestamp': instance.customerTimestamp,
      'statementDescription': instance.statementDescription,
      'created': instance.created,
      'receivedByRecipient': instance.receivedByRecipient,
      'correspondentIds': instance.correspondentIds,
      'failureReason': instance.failureReason,
    };

RefundFailureReason _$RefundFailureReasonFromJson(Map<String, dynamic> json) =>
    RefundFailureReason(
      failureCode: json['failureCode'] as String,
      failureMessage: json['failureMessage'] as String,
    );

Map<String, dynamic> _$RefundFailureReasonToJson(
        RefundFailureReason instance) =>
    <String, dynamic>{
      'failureCode': instance.failureCode,
      'failureMessage': instance.failureMessage,
    };
