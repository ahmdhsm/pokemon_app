import 'package:path/path.dart';
import 'package:pokemon_app/core/utils/document_directory.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastUtil {
  final String databaseName;

  SembastUtil({
    required this.databaseName,
  });

  saveData({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    var dir = await DocumentDirectory.getApplicationDirectory();
    await dir.create(recursive: true);
    var dbPath = join(dir.path, '$databaseName.db');
    var db = await databaseFactoryIo.openDatabase(dbPath);
    var store = intMapStoreFactory.store();
    await store.record(id).put(db, data);
  }

  Future<Map<String, dynamic>?> getData({
    required int id,
  }) async {
    var dir = await DocumentDirectory.getApplicationDirectory();
    await dir.create(recursive: true);
    var dbPath = join(dir.path, '$databaseName.db');
    var db = await databaseFactoryIo.openDatabase(dbPath);
    var store = intMapStoreFactory.store();
    var data = await store.record(id).get(db);
    return data;
  }
}
