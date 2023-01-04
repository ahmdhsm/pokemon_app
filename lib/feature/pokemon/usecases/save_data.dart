import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SaveData {
  Future<void> save() async {
    var dir = await getApplicationDocumentsDirectory();
// make sure it exists
    await dir.create(recursive: true);
// build the database path
    var dbPath = join(dir.path, 'pokemon_data.db');
// open the database
    var db = await databaseFactoryIo.openDatabase(dbPath);

    var store = intMapStoreFactory.store();

    await store.record(1234).put(db, {'value': 'test'});

    var records = await store.records([1234]).get(db);

    print(records[0]);
  }
}
