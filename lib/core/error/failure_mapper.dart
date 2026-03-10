import 'package:dio/dio.dart';
import 'failure.dart';

class FailureMapper {
  static Failure map(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          return const ConnectionFailure('connectionLostMessage');

        case DioExceptionType.badResponse:
          return const ServerFailure('serverErrorMessage');

        default:
          return ServerFailure(error.message ?? 'Unknown error');
      }
    }

    return ServerFailure(error.toString());
  }
}
