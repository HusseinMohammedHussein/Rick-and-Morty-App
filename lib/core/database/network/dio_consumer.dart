import 'package:dio/dio.dart';
import 'package:rickandmorty_app/core/error/error_model.dart';
import 'package:rickandmorty_app/core/error/exception.dart';

import 'api_consumer.dart';
import 'endpoints.dart';

class DioConsumer extends ApiConsumer {
  late final Dio dio;

  DioConsumer() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        contentType: Headers.jsonContentType,
        validateStatus: (status) => true,
      ),
    )..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
          request: true,
          responseHeader: true,
          requestHeader: true,
        ),
      );
  }

  @override
  Future<dynamic> put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      data = data as Map<String, dynamic>;
      final res = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final res = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      data = data;
      final res = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      data = data;
      final res = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  handleDioException(e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
        throw ConnectionErrorException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badCertificate:
        throw BadCertificateException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeoutException(ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.receiveTimeout:
        throw ReceiveTimeoutException(ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.sendTimeout:
        throw SendTimeoutException(ErrorModel.fromJson(e.response!.data));
      // throw ServerException('connection Error');

      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400: // Bad request

            throw BadResponseException(ErrorModel.fromJson(e.response!.data));

          case 401: //unauthorized
            throw UnauthorizedException(ErrorModel.fromJson(e.response!.data));

          case 403: //forbidden
            throw ForbiddenException(ErrorModel.fromJson(e.response!.data));

          case 404: //not found
            throw NotFoundException(ErrorModel.fromJson(e.response!.data));

          case 409: //cofficient
            // throw ServerException('badResponse');
            throw CofficientException(ErrorModel.fromJson(e.response!.data));

          case 504: // Bad request

            throw BadResponseException(ErrorModel.fromJson(e.response!.data));
          case 500: // Bad Ressponse

            throw BadResponseException(ErrorModel.fromJson(e.response!.data));
        }

      case DioExceptionType.cancel:
        throw CancelException(
            ErrorModel(errorMessage: e.toString(), status: '500'));

      case DioExceptionType.unknown:
        throw UnknownException(
            ErrorModel(errorMessage: e.toString(), status: '500'));
    }
  }
}
