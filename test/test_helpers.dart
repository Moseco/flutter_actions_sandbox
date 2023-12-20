import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter_actions_sandbox/iser_service.dart';
import 'package:path/path.dart' as path;
import 'package:isar/isar.dart';

Future<Isar> setUpIsar() async {
  // Create directory .dart_tool/isar_test/tmp/
  final dartToolDir = path.join(Directory.current.path, '.dart_tool');
  String testTempPath = path.join(dartToolDir, 'isar_test', 'tmp');
  String downloadPath = path.join(dartToolDir, 'isar_test');
  await Directory(testTempPath).create(recursive: true);

  // Get name of isar binary based on platform
  late String binaryName;
  switch (Abi.current()) {
    case Abi.macosX64:
      binaryName = 'libisar.dylib';
      break;
    case Abi.linuxX64:
      binaryName = 'libisar.so';
      break;
    case Abi.windowsX64:
      binaryName = 'isar.dll';
      break;
    default:
      throw Exception('Unsupported platform for testing');
  }

  // Downloads Isar binary file
  await Isar.initializeIsarCore(
    libraries: {
      Abi.current(): '$downloadPath${Platform.pathSeparator}$binaryName'
    },
    download: true,
  );

  // Open Isar instance with random name
  return Isar.open(
    IsarService.schemas,
    directory: testTempPath,
    name: Random().nextInt(pow(2, 32) as int).toString(),
    inspector: false,
  );
}
