
import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:fluttertoast/fluttertoast.dart';
import 'api_response.dart';
import 'app_storage.dart';
import 'end_points.dart';

class ApiService {
  late dio.Dio _dio;

  /// AUTH FAILURE MESSAGES
  static const List<String> _authErrors = [
    "USER_INACTIVE",
    "USER_NOT_FOUND",
    "COMPANY_INACTIVE",
    "COMPANY_NOT_FOUND",
    "SUBSCRIPTION_EXPIRED",
    "SUBSCRIPTION_INACTIVE",
    "SUBSCRIPTION_NOT_FOUND",
  ];

  ApiService() {

    _dio = dio.Dio(
      dio.BaseOptions(
        baseUrl: 'http://api.brightedumont.com', // development
        // baseUrl: 'https://syngroo-backend.syngrid.com', // live
        // baseUrl: 'http://192.168.0.17:4000', // local
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
        validateStatus: (status) => true,
      ),
    );

    _dio.interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = AppStorage.getData(AppStorage.keyIsBearerToken);
          log('TOKEN : $token');
          if (token != null && token.toString().isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
        onError: (e, handler) async {
          final path = e.requestOptions.path;

          // ✅ 1. Skip login & refresh endpoints
          if (path.contains(Endpoints.login)
              || path.contains(Endpoints.refreshtoken)
          ) {
            handler.next(e);
            return;
          }
          if (e.response?.statusCode == 401) {
            final refreshed = await refreshToken();
            if (refreshed) {
              final res = await _retryRequest(e.requestOptions);
              handler.resolve(res);
              return;
            }
            Fluttertoast.showToast(msg: "Session expired. Please login again");
            logout();
            handler.next(e);
            return;
          }

          handler.next(e);
        },
      ),
    );
  }

  static void logout() async {
    await AppStorage.clear();
  }

  /// GET Request
  Future<ApiResponse> get(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    getFullUrl(endpoint);
    log('params : $params');
    try {
      final res = await _dio.get(endpoint, queryParameters: params);
      return _processResponse(res);
    } on dio.DioException catch (e) {
      return ApiResponse(success: false, message: _extractErrorMessage(e));
    }
  }

  getFullUrl(String endpoint) {
    final uri = Uri.parse(_dio.options.baseUrl + endpoint);
    print("GET Request: $uri");
  }

  Future<ApiResponse> patch(String endpoint, {dynamic data}) async {
    getFullUrl(endpoint);
    try {
      final res = await _dio.patch(endpoint, data: data ?? {});
      return _processResponse(res);
    } on dio.DioException catch (e) {
      return ApiResponse(
        success: false,
        message: _extractErrorMessage(e),
      );
    }
  }
  /// POST Request
  Future<ApiResponse> post(String endpoint, dynamic data) async {
    getFullUrl(endpoint);
    log('data : $data');
    try {
      final res = await _dio.post(endpoint, data: data);
      return _processResponse(res);
    } on dio.DioException catch (e) {
      return ApiResponse(success: false, message: _extractErrorMessage(e));
    }
  }

  /// PUT Request
  Future<ApiResponse> put(String endpoint, dynamic data) async {
    getFullUrl(endpoint);
    log('data : $data');
    try {
      final res = await _dio.put(endpoint, data: data);
      return _processResponse(res);
    } on dio.DioException catch (e) {
      return ApiResponse(success: false, message: _extractErrorMessage(e));
    }
  }

  /// DELETE Request
  Future<ApiResponse> delete(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    log('params : $params');
    getFullUrl(endpoint);
    try {
      final res = await _dio.delete(endpoint, queryParameters: params);
      return _processResponse(res);
    } on dio.DioException catch (e) {
      return ApiResponse(success: false, message: _extractErrorMessage(e));
    }
  }

  ApiResponse _processResponse(dio.Response res) {
    // log('_processResponse : ${res.data}');

    if (res.data is Map) {
      final map = res.data as Map;
      final msg = map["message"];

      /// 🔴 BUSINESS AUTH FAILURE (HTTP 200)
      if (_authErrors.contains(msg)) {
        Fluttertoast.showToast(msg: msg.replaceAll('_', ' '));
        logout();
        return ApiResponse(success: false, message: msg);
      }

      if (map["success"] == false || map["status"] == false) {
        return ApiResponse(success: false, message: msg ?? "Request failed");
      }

      return ApiResponse(
        success: true,
        data: map["data"] ?? map,
        message: map["message"],
        page: map["page"],
        limit: map["limit"],
        total: map["total"],
        totalPages: map["totalPages"],
      );
    }

    print('is not map');

    return ApiResponse(success: true, data: res.data, message: "Success");
  }

  /// REFRESH TOKEN
  Future<bool> refreshToken() async {
    try {
      final refreshToken = AppStorage.getData(AppStorage.keyIsRefreshToken);
      if (refreshToken == null) return false;

      final res = await _dio.post(
        Endpoints.refreshtoken,
        data: {"refresh_token": refreshToken},
      );

      if (res.statusCode == 200 && res.data["access_token"] != null) {
        AppStorage.setData(
          AppStorage.keyIsBearerToken,
          res.data["access_token"],
        );

        if (res.data["refresh_token"] != null) {
          AppStorage.setData(
            AppStorage.keyIsRefreshToken,
            res.data["refresh_token"],
          );
        }
        return true;
      }
    } catch (_) {}

    return false;
  }

  /// RETRY ORIGINAL REQUEST
  Future<dio.Response> _retryRequest(dio.RequestOptions requestOptions) async {
    final newToken = AppStorage.getData(AppStorage.keyIsBearerToken);

    final options = dio.Options(
      method: requestOptions.method,
      headers: {...requestOptions.headers, "Authorization": "Bearer $newToken"},
    );

    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  // ✅ Error Handler
  // void _handleError(dio.DioException e) {
  //   final msg =
  //       e.response?.data?['message'] ??
  //       e.message ??
  //       "Unexpected error occurred";
  //   Repository.showtoast(msg: msg);
  // }

  String _extractErrorMessage(dio.DioException e) {
    // log('DioException err : $e');
    // log('DioException err : ${e.error}');
    // log('DioException data : ${e.response!.data}');
    if (e.response?.data != null &&
        e.response!.data is Map &&
        e.response!.data['message'] != null) {
      final msg = e.response!.data['message'].toString();

      print('VVVV : $msg');

      return msg;
    }
    if (e.response?.data is String) {
      final body = e.response!.data.toString();

      if (body.startsWith("<html")) {
        return "Server unavailable (Bad Gateway).";
      }
    }

    switch (e.response?.statusCode) {
      case 400:
        return "Bad Request (400)";
      case 401:
        return "Unauthorized (401)";
      case 403:
        return "Access Denied (403)";
      case 404:
        return "Not Found (404)";
      case 500:
        return "Server Error (500)";
    }

    if (e.type == dio.DioExceptionType.connectionError) {
      return "No internet connection";
    }
    if (e.type == dio.DioExceptionType.connectionTimeout) {
      return "Connection Timeout";
    }
    if (e.type == dio.DioExceptionType.receiveTimeout) {
      return "Receive Timeout";
    }

    return e.message ?? "Unexpected error";
  }
}
