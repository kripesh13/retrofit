import 'package:api_call_with_retrofit/network_model/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final restClint = RestClient(dio);
final dio = getDio();

Dio getDio() {
  BaseOptions options = BaseOptions(
    baseUrl: '',
    receiveDataWhenStatusError: true,
    sendTimeout: const Duration(seconds: 30),
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    // headers: {
    //   "Content-Type": "application/json",
    // },
  );

  Dio dio = Dio(options);
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (request, handler) {
      debugPrint("api request body ${request.data}");
      return handler.next(request);
    },
    onResponse: (Response response, ResponseInterceptorHandler handler) {
      debugPrint("Api ko Response Data --> ${response.data}");
      return handler.next(response);
    },
    onError: (DioException error, handler) {
      final response = error.response;
      debugPrint(
          " API Error --> Status Code --> ${response?.statusCode} --> ${response?.statusMessage}");
      return handler.next(error);
    },
  ));
  return dio;
}
