import 'package:json_annotation/json_annotation.dart';

part 'payment_data.g.dart';

@JsonSerializable()
class PaymentData {
  @JsonKey(name: 'deposit_id')
  final String depositId;
  final double price;
  final String title;
  final String? name;
  final String currency;
  final String basePaymentCountryIso;
  final String reason;
  final String returnUrl;

  PaymentData({
    required this.depositId,
    required this.price,
    required this.title,
    this.name,
    required this.currency,
    required this.basePaymentCountryIso,
    required this.reason,
    required this.returnUrl,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) => _$PaymentDataFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentDataToJson(this);
}

@JsonSerializable()
class InitiatePaymentResponse {
  final String redirectUrl;
  final bool error;
  final String? message;

  InitiatePaymentResponse({
    required this.redirectUrl,
    required this.error,
    this.message,
  });

  factory InitiatePaymentResponse.fromJson(Map<String, dynamic> json) => _$InitiatePaymentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InitiatePaymentResponseToJson(this);
}