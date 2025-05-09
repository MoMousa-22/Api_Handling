import 'package:api_handling/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      // bad response has multiple cases .. if i need to know any case i get the status code from backend api and handle it like that
      switch (e.response!.statusCode) {
        case 301:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 400:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 401:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 403:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 404:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 500:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
