import 'dart:convert';

import 'package:dio/dio.dart';

import '../generated/l10n.dart';
import '../models/api_state.dart';
import '../utilities/logger.dart';


class sendSMTPRepository {
  Stream<ApiState> sendSMTP({required FormData formData}) async* {
    yield LoadingState();
    try {
       Response response;

       final Dio _dio = Dio(BaseOptions(
         connectTimeout: const Duration(minutes: 3),
         receiveTimeout: const Duration(minutes: 3),
         sendTimeout: const Duration(minutes: 3),
         validateStatus: (status) => status == 200,
       ));
       String basicAuth = 'Basic ${base64.encode(utf8.encode('Sadek:123'))}';
       _dio.options.headers["Authorization"] = basicAuth;

       _dio.interceptors.add(InterceptorsWrapper(
         onError: (e, handler) async {
           print(e.response);
           if (e.response?.statusCode == 400) {
             print(e.error);

             print(e.response!.data);
             return handler.reject(DioError(
                 requestOptions: RequestOptions(path: ''),
                 error: e.response!.data));
           } else {
             Logger.log(
                 message: e.message!,
                 name: 'error response:',
                 stackTrace: e.stackTrace,
                 error: e.error);
             return handler.next(e);
           }
         },
         onRequest: (options, handler) {
           return handler.next(options);
         },
         onResponse: (response, handler) {
           Logger.log(
               message: 'RESPONSE: ${json.encode(response.data)}',
               name: response.statusMessage!);

           return handler.next(response);
         },
       ));

       response = await _dio.post(
         'http://broadcastmp-001-site14.atempurl.com/api/Emails/SendAttachments',
         data: formData,
         options: Options(
           headers: {'Content-Type': 'application/json; charset=UTF-8'},
           method: "post",
         ),
       );
       print(response.data);
       yield SuccessState(null);
    } catch (e) {
      print(e);
      yield FailedState(
          message: S.current.error, loggerName: 'forgetPassword api failed:');
    }
  }
}
