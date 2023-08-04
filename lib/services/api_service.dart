import 'package:antonx_flutter_boilerplate_3/app/app.locator.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:antonx_flutter_boilerplate_3/responses/base_responses/request_response.dart';
import 'package:antonx_flutter_boilerplate_3/services/config_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/interceptor_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/local_storage_service.dart';
import 'package:dio/dio.dart';

class ApiService {
  final log = getLogger('ApiService');
  final _config = locator<ConfigService>();

  Future<Dio> launchDio() async {
    String? accessToken = locator<LocalStorageService>().accessToken;
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.interceptors.add(TokenInterceptor());
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer $accessToken';

    dio.options.followRedirects = false;
    // *STOP REQUESTING IN CASE OF TIMEOUT OR SLOW INTERNET CONNECTION
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.options.sendTimeout = const Duration(seconds: 10);

    dio.options.validateStatus = (s) {
      if (s != null) {
        return s < 500;
      } else {
        return false;
      }
    };
    return dio;
  }


  get({
    required String endPoint,
    params,
  }) async {
    String? errorMessage;
    try {
      Dio dio = await launchDio();
      final response = await dio.get(
        '${_config.baseUrl}/$endPoint',
        queryParameters: params,
      );

      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (error) {
      log.e('@get error $error');
      log.e('@get error message: $errorMessage');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  post({
    required String endPoint,
    data,
  }) async {
    final Response response;
    String? errorMessage;
    try {
      log.d('post base url:${_config.baseUrl}/$endPoint');
      Dio dio = await launchDio();
      response = await dio.post(
        '${_config.baseUrl}/$endPoint',
        data: data,
      );

      // Dio full response error handling checks

      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (error) {
      log.e('@get error $error');
      log.e('@get error message: $errorMessage');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  put({
    required String endPoint,
    data,
  }) async {
    String? errorMessage;
    try {
      Dio dio = await launchDio();
      final response = await dio.put(
        '${_config.baseUrl}/$endPoint',
        data: data,
      );
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (error) {
      log.e('@get error $error');
      log.e('@get error message: $errorMessage');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  delete({
    required String endPoint,
    params,
  }) async {
    String? errorMessage;
    try {
      Dio dio = await launchDio();
      final response = await dio.delete(
        '${_config.baseUrl}/$endPoint',
        queryParameters: params,
      );
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (error) {
      log.e('@get error $error');
      log.e('@get error message: $errorMessage');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }
}
