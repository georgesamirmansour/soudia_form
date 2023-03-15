
import 'package:dio/dio.dart';
import 'package:first_form/models/sendEmail_response.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';
@RestApi(baseUrl: "http://broadcastmp-001-site14.atempurl.com/api/")
abstract class ApiClient{

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("Emails/SendAttachments")
  Future<void> sendEmailFirstForm(@Body() FormData formData);
}