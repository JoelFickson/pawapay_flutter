import 'package:json_annotation/json_annotation.dart';

part 'pawapay_network_response.g.dart';

@JsonSerializable()
class PawaPayNetworkResponse {
  final String errorMessage;
  final int statusCode;
  final String errorObject;

  PawaPayNetworkResponse({
    required this.errorMessage,
    required this.statusCode,
    required this.errorObject,
  });

  factory PawaPayNetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$PawaPayNetworkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PawaPayNetworkResponseToJson(this);
}