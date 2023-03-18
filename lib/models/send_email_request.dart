import 'package:json_annotation/json_annotation.dart';

part 'send_email_request.g.dart';

@JsonSerializable()
class SendEmailRequest{
  String? Body;
  dynamic Files;
  SendEmailRequest(this.Body,this.Files);

  factory SendEmailRequest.fromJson(Map<String, dynamic> json) => _$SendEmailRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SendEmailRequestToJson(this);
}