import 'package:flutter_actions_sandbox/datamodels/info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

import 'test_helpers.dart';

void main() {
  group('GroupName', () {
    late Isar isar;

    setUp(() async {
      isar = await setUpIsar();
    });

    tearDown(() {
      isar.close(deleteFromDisk: true);
    });

    test('Isar test', () async {
      await isar.writeTxn(() async {
        await isar.infos.put(Info()..version = 5);
      });

      final info = await isar.infos.get(0);
      expect(info!.id, 0);
      expect(info.version, 5);
    });
  });
}
