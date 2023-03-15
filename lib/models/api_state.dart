
import 'package:first_form/utilities/logger.dart';

abstract class ApiState<T> {
  T? response;
  dynamic error;
  String loggerName, message;

  ApiState(
      {required this.response,
      this.error,
      this.loggerName = '',
      this.message = ''}) {
    if (loggerName.isNotEmpty)
      Logger.log(message: message, name: loggerName, error: error);
  }
}

class LoadingState<T> extends ApiState<T> {
  LoadingState()
      : super(response: null, message: '', error: null, loggerName: '');
}

class FailedState<T> extends ApiState<T> {
  FailedState({required String message, required String loggerName})
      : super(
            response: null,
            message: message,
            error: null,
            loggerName: loggerName);
}

class ErrorState<T> extends ApiState<T> {
  ErrorState(
      {required String message, required String loggerName, dynamic error})
      : super(
            response: null,
            message: message,
            error: error,
            loggerName: loggerName);
}

class SuccessState<T> extends ApiState<T> {
  SuccessState(T t, {String? message})
      : super(response: t, message: message ?? '', error: null, loggerName: '');
}

class IdleState<T> extends ApiState<T> {
  IdleState() : super(response: null, message: '', error: null, loggerName: '');
}
