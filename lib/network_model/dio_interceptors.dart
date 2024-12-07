import 'package:api_call_with_retrofit/network_model/rest_client.dart';
import 'package:api_call_with_retrofit/network_response/api_response.dart';
import 'package:api_call_with_retrofit/network_response/app_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final restClient = RestClient(dio);
final dio = getDio();

Dio getDio() {
  BaseOptions options = BaseOptions(
    baseUrl: 'https://api.example.com', // Replace with your API base URL
    receiveDataWhenStatusError: true,
    sendTimeout: const Duration(seconds: 30),
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {
      "Content-Type": "application/json",
      // 'Authorization':
      //     'Bearer ${LocalStorageService.read(LocalStorageKeys.accessToken)}',
    },
  );

  Dio dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (request, handler) {
      // Dynamically add Authorization token if needed
      request.headers['Authorization'] = 'Bearer ${_getAccessToken()}';
      debugPrint("API request body: ${request.data}");
      return handler.next(request);
    },
    onResponse: (Response response, ResponseInterceptorHandler handler) {
      debugPrint("API Response Data --> ${response.data}");

      switch (response.statusCode) {
        case 200:
          return handler.next(response);
        case 400:
          throw BadRequestException('Invalid URL');
        case 401:
          // navigatorKey.currentState?.pushNamed('/unAuthorizedScreen');
          throw UnAuthorizedException('You are not authorized or authenticated.');
        case 403:
          // navigatorKey.currentState?.pushNamed('/unAuthorizedScreen');
          throw UnAuthorizedException('You are not authorized or authenticated.');
        case 404:
          throw BadRequestException('Invalid Account Details');
        default:
          throw Exception('Error communicating with server');
      }
    },
    onError: (DioException error, handler) {
      final response = error.response;
      debugPrint("API Error --> Status Code --> ${response?.statusCode} --> ${response?.statusMessage}");
      _handleDioException(error);
      return handler.next(error);
    },
  ));

  return dio;
}

String? _getAccessToken() {
  // Placeholder for fetching the token, e.g., from local storage
  return 'your_access_token_here';
}

void _handleDioException(DioException e) {
  if (e.response?.statusCode == 401) {
    // navigatorKey.currentState?.pushNamed('/unAuthorizedScreen');
  }
  
  if (e.response?.data != null && e.response?.data['message'] != null) {
    ApiResponse.error(e.response!.data['message']);
  } else {
    _handleSocketException();
  }

  throw AppException(e.response?.data?['message'] ?? 'An unknown error occurred', '');
}

void _handleSocketException() {
  throw FetchDataException('No internet connection');
}