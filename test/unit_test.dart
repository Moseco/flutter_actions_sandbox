import 'package:flutter_actions_sandbox/download_options.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GroupName', () {
    test('TestName', () {
      expect(1 + 1, 2);
      expect(1 + 2, 3);
      expect(1 + 3, 4);
      expect(1 + 4, 5);
    });

    test('Secret test', () {
      expect(DownloadOptions.downloadUrl, isNotNull);
    });
  });
}
