import 'package:flutter_test/flutter_test.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('NotificationServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
