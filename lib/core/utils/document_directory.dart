import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DocumentDirectory {
  static Future<Directory> getApplicationDirectory() {
    return getApplicationDocumentsDirectory();
  }
}
