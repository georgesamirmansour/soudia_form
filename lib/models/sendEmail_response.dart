import 'package:json_annotation/json_annotation.dart';

part 'sendEmail_response.g.dart';

@JsonSerializable()
class SendEmailRequest{
  String? Body;
  dynamic Files;
  SendEmailRequest(this.Body,this.Files);

  factory SendEmailRequest.fromJson(Map<String, dynamic> json) => _$SendEmailRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SendEmailRequestToJson(this);
}