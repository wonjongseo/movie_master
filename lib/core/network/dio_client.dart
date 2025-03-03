import 'package:dio/dio.dart';
import 'package:movie_report_app/core/constants/api_url.dart';
import 'package:movie_report_app/core/network/interceptors.dart';

class DioClient {
  late final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
              baseUrl: ApiUrl.baseUrl,
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              responseType: ResponseType.json,
              sendTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10)),
        )..interceptors
            .addAll([AuthorizationInterceptor(), LoggerInterceptor()]);

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.get(url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response;
    } on DioException {
      rethrow;
    }
  }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onRecevieProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onRecevieProgress,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceviePgoress,
  ) async {
    try {
      final Response response = await _dio.put(url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceviePgoress);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String url, Map<String, dynamic> queryParameters,
      Options? options, CancelToken? cancelToken) async {
    try {
      final Response response = await _dio.delete(url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
