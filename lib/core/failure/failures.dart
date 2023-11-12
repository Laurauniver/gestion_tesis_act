import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);
  final String message;
  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [message];
}

///***DIO FAILURES***///
class DioServerFailure extends Failure {
  const DioServerFailure({
    required String message,
    this.errorType,
    this.statusCode,
  }) : super(message);

  final DioErrorType? errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [message, errorType, statusCode];
}

class DioRequestFailure extends Failure {
  const DioRequestFailure({
    required String message,
    this.errorType,
    this.statusCode,
  }) : super(message);

  final DioErrorType? errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [message, errorType];
}

///***END DIO FAILURES***///

///***NETWORK FAILURES***///

//4xx Client Failures
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    required String message,
    this.errorType,
    this.statusCode = 401,
  }) : super(message);

  final DioErrorType? errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [message, errorType, statusCode];
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({
    required String message,
    this.errorType,
    this.statusCode = 403,
  }) : super(message);

  final DioErrorType? errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [message, errorType, statusCode];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    required String message,
    this.errorType,
    this.statusCode = 404,
  }) : super(message);

  final DioErrorType? errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [message, errorType, statusCode];
}

class MethodNotAllowedFailure extends Failure {
  const MethodNotAllowedFailure({
    required String message,
    this.errorType,
    this.statusCode = 405,
  }) : super(message);

  final DioErrorType? errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [message, errorType, statusCode];
}

//5xx Server Failures
class InternalServerFailure extends Failure {
  const InternalServerFailure({
    required String message,
    this.errorType,
    this.statusCode = 500,
  }) : super(message);

  final DioErrorType? errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [message, errorType, statusCode];
}

class NotImplementedFailure extends Failure {
  const NotImplementedFailure({
    required String message,
    this.errorType,
    this.statusCode = 501,
  }) : super(message);

  final DioErrorType? errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [message, errorType, statusCode];
}

class BadGatewayFailure extends Failure {
  const BadGatewayFailure({
    required String message,
    this.errorType,
    this.statusCode = 502,
  }) : super(message);

  final DioErrorType? errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [message, errorType, statusCode];
}

class ServiceUnavailableFailure extends Failure {
  const ServiceUnavailableFailure({
    required String message,
    this.errorType,
    this.statusCode = 503,
  }) : super(message);

  final DioErrorType? errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [message, errorType, statusCode];
}

class GatewayTimeOutFailure extends Failure {
  const GatewayTimeOutFailure({
    required String message,
    this.errorType,
    this.statusCode = 504,
  }) : super(message);

  final DioErrorType? errorType;
  final int? statusCode;

  @override
  List<Object?> get props => [message, errorType, statusCode];
}

///**END NETWORK FAILURES***///

class NullValueFromApiFailure extends Failure {
  const NullValueFromApiFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class UnknownFailure extends Failure {
  const UnknownFailure({required String message}) : super(message);
  @override
  List<Object?> get props => [message];
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(String message) : super(message);
  @override
  List<Object?> get props => [message];
}

class SerializationFailure extends Failure {
  const SerializationFailure(String message) : super(message);
  @override
  List<Object?> get props => [message];
}

class NoDataFailure extends Failure {
  const NoDataFailure(String message) : super(message);
  @override
  List<Object?> get props => [message];
}

class PermissionFailure extends Failure {
  const PermissionFailure(String message) : super(message);
  @override
  List<Object?> get props => [message];
}

class NoConnectivityFailure extends Failure {
  const NoConnectivityFailure({String? message})
      : super(message ?? 'No hay conexión a internet');

  @override
  List<Object?> get props => [message];
}
