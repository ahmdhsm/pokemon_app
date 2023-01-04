import 'package:fpdart/fpdart.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon_app/core/error/failure.dart';
import 'package:pokemon_app/feature/pokemon/data/online_data.dart';
import 'package:pokemon_app/feature/pokemon/usecases/pokemon_data.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../data/offline_data.dart';
import '../entities/pokemon_entity.dart';
import 'save_data.dart';

class GetData {
  // final PokemonData pokemonData;

  // const GetData(this.pokemonData);
  // Future<Either<Failure, List<PokemonEntity>>> call() {
  //   // SaveData().save();
  //   return pokemonData.call().then(
  //         (value) => value.fold(
  //           (l) => left(Failure()),
  //           (r) => right(
  //             r.map<PokemonEntity>((e) => convert(e)).toList(),
  //           ),
  //         ),
  //       );
  // }

  PokemonEntity convert(Map pokemon) {
    return PokemonEntity.fromJson(pokemon as Map<String, dynamic>);
  }

  Future<Either<Failure, List<PokemonEntity>>> tes(int start) async {
    var c = await OfflineData().call(start);
    var tes1 = <PokemonEntity>[];
    c.fold(
      (l) {
        tes1 = [];
      },
      (r) async {
        if (r.isEmpty) {
          tes1 = [];
        } else {
          tes1 = r;
        }
      },
    );

    if (tes1.isEmpty) {
      var a = await OnlineData().call(start);
      await a.fold(
        (l) => left(l),
        (r) async {
          var dir = await getApplicationDocumentsDirectory();
          await dir.create(recursive: true);
          var dbPath = join(dir.path, 'pokemon_data.db');
          var db = await databaseFactoryIo.openDatabase(dbPath);
          var store = intMapStoreFactory.store();

          await db.transaction(
            (txn) async {
              for (var element in r) {
                await store
                    .record(PokemonEntity.fromJson(element).id)
                    .put(txn, element);
              }
            },
          );

          tes1 = r.map<PokemonEntity>((e) => convert(e)).toList();
          print('${tes1.length} aaaa');
        },
      );
    }

    return right(tes1);

    // // var b = await OfflineData().call();

    // // b.foldRight(b, (acc, b) => null)
    // OfflineData().call().then(
    //   (value) {
    //     return value.fold(
    //       (l) => left(l),
    //       (r) async {
    //         if (r.isEmpty) {
    //           return tes2();
    //         } else {
    //           return right(r);
    //         }
    //       },
    //     );
    //   },
    // );

    // return left(Failure());
  }

  // Future<Either<Failure, List<PokemonEntity>>> tes2() async {
  //   var a = await OnlineData().call();
  //   a.fold(
  //     (l) => left(l),
  //     (r) async {
  //       var dir = await getApplicationDocumentsDirectory();
  //       await dir.create(recursive: true);
  //       var dbPath = join(dir.path, 'my_database.db');
  //       var db = await databaseFactoryIo.openDatabase(dbPath);
  //       var store = intMapStoreFactory.store();

  //       await db.transaction(
  //         (txn) async {
  //           r.forEach(
  //             (element) async {
  //               await store
  //                   .record(PokemonEntity.fromJson(element).id)
  //                   .put(db, element);
  //             },
  //           );
  //         },
  //       );

  //       return r.map<PokemonEntity>((e) => convert(e)).toList();
  //     },
  //   );
  //   return right([]);
  // }
}
