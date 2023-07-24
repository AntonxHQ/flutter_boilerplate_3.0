import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:get/get.dart';

class LocalizationService {
  final log = getLogger('LocalizationService');

  getLocalizedKey(String key) {
    String currentLanguageCode = Get.locale!.languageCode;
    log.d('Localized key is: ${key}_$currentLanguageCode');
    return '${key}_$currentLanguageCode';
  }

  Map<String, Map<String, String>> get keys {
    const Map<String, String> english = {
      "hello": "Hello world!",
    };

    const Map<String, String> arabic = {
      "hello": '!مرحبا بالعالم',
    };

    return {
      'en': english,
      'ar': arabic,
    };
  }
}
