import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon_app/core/error/failure.dart';

import 'package:fpdart/src/either.dart';
import 'package:pokemon_app/feature/pokemon/entities/pokemon_entity.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../usecases/pokemon_data.dart';

class OfflineData {
  @override
  Future<Either<Failure, List<PokemonEntity>>> call(int start) async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      await dir.create(recursive: true);
      var dbPath = join(dir.path, 'pokemon_data.db');
      var db = await databaseFactoryIo.openDatabase(dbPath);
      var store = intMapStoreFactory.store();
      var data = await store
          .records(List.generate(20, (index) => index + 1 + start))
          .get(db);
      var finalData = <PokemonEntity>[];
      if (data.first == null) {
        return right([]);
      }
      data.forEach(
        (element) {
          if (element != null) {
            finalData.add(PokemonEntity.fromJson(element));
          }
        },
      );

      // store.delete(db);

      return right(finalData);
    } catch (e) {
      return left(Failure());
    }
  }
}
