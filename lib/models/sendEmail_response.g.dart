// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sendEmail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailRequest _$SendEmailRequestFromJson(Map<String, dynamic> json) =>
    SendEmailRequest(
      json['Body'] as String?,
      json['Files'] as dynamic
    );

Map<String, dynamic> _$SendEmailRequestToJson(SendEmailRequest instance) =>
    <String, dynamic>{
      'Body': instance.Body,
      'Files': instance.Files,
    };
