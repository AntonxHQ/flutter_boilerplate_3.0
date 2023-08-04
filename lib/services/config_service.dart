import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:stacked/stacked_annotations.dart';

class ConfigService {
  final log = getLogger('configService');
  final String _env;
  final String _devBaseUrl = '@devUrl';
  final String _testBaseUrl = '@testUrl';
  final String _prodBaseUrl = '@prodUrl';
  late String _baseUrl;

  /// Getters
  String get env => _env;
  String get baseUrl => _baseUrl;

  /// Constructor
  ConfigService(this._env) {
    _setupBaseUrl();
    log.i('BASE_URL: $baseUrl');
  }

  _setupBaseUrl() {
    if (_env == Environment.prod) {
      _baseUrl = _prodBaseUrl;
    } else if (_env == Environment.test) {
      _baseUrl = _testBaseUrl;
    } else if (_env == Environment.dev) {
      _baseUrl = _devBaseUrl;
    } else {
      _baseUrl = _prodBaseUrl;
    }
  }
}
