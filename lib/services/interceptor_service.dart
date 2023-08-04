import 'package:antonx_flutter_boilerplate_3/app/app.locator.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:antonx_flutter_boilerplate_3/services/authentication_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/local_storage_service.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/sign_in/sign_in_view.dart';
import 'package:dio/dio.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as getX;

class TokenInterceptor extends Interceptor {
  final log = getLogger('TokenInterceptor');
  final _localStorageService = locator<LocalStorageService>();

  TokenInterceptor();
  late final requestOptions;

  @override
  Future onRequest(RequestOptions? options, handler) async {
    log.i('@Interceptor.onRequest: Dio Request $options');
    requestOptions = options;
    return handler.next(options!);
  }

  @override
  Future onResponse(Response response, handler) async {
    log.i('@Interceptor.onResponse: Dio Response $response');
    if (response.statusCode == 401) {
      locator<AuthenticationService>().isLogin = false;
      _localStorageService.accessToken = null;
      getX.Get.offAll(const SignInView());
    } else {
      handler.resolve(response);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.i('@Interceptor.onError: Dio Error ${err.message}');
    getX.Get.snackbar('Request Failed', "${err.message}");
    handler.resolve(
      Response(
        requestOptions: requestOptions,
        data: {
          'error': err.message,
        },
        statusCode: 410,
      ),
    );
    super.onError(err, handler);
  }
}
