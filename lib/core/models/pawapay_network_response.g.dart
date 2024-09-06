// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pawapay_network_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PawaPayNetworkResponse _$PawaPayNetworkResponseFromJson(
        Map<String, dynamic> json) =>
    PawaPayNetworkResponse(
      errorMessage: json['errorMessage'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      errorObject: json['errorObject'] as String,
    );

Map<String, dynamic> _$PawaPayNetworkResponseToJson(
        PawaPayNetworkResponse instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'statusCode': instance.statusCode,
      'errorObject': instance.errorObject,
    };
