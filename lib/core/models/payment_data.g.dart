// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentData _$PaymentDataFromJson(Map<String, dynamic> json) => PaymentData(
      depositId: json['deposit_id'] as String,
      price: (json['price'] as num).toDouble(),
      title: json['title'] as String,
      name: json['name'] as String?,
      currency: json['currency'] as String,
      basePaymentCountryIso: json['basePaymentCountryIso'] as String,
      reason: json['reason'] as String,
      returnUrl: json['returnUrl'] as String,
    );

Map<String, dynamic> _$PaymentDataToJson(PaymentData instance) =>
    <String, dynamic>{
      'deposit_id': instance.depositId,
      'price': instance.price,
      'title': instance.title,
      'name': instance.name,
      'currency': instance.currency,
      'basePaymentCountryIso': instance.basePaymentCountryIso,
      'reason': instance.reason,
      'returnUrl': instance.returnUrl,
    };

InitiatePaymentResponse _$InitiatePaymentResponseFromJson(
        Map<String, dynamic> json) =>
    InitiatePaymentResponse(
      redirectUrl: json['redirectUrl'] as String,
      error: json['error'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InitiatePaymentResponseToJson(
        InitiatePaymentResponse instance) =>
    <String, dynamic>{
      'redirectUrl': instance.redirectUrl,
      'error': instance.error,
      'message': instance.message,
    };
