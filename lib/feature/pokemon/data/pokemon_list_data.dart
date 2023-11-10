import 'package:pokemon_app/const/app_url.dart';
import 'package:pokemon_app/const/database_name.dart';
import 'package:pokemon_app/core/utils/dio_util.dart';
import 'package:pokemon_app/core/utils/sembast_util.dart';
import 'package:pokemon_app/feature/pokemon/model/pokemon_list_model.dart';

class PokemonListData {
  final _dio = DioUtil();

  final _limit = 20;

  final sembastUtil = SembastUtil(
    databaseName: DatabaseName.pokemonDetailDatabase,
  );

  Future<List<PokemonListModel>> getOnlineData(int start) async {
    var pokemonListResponse = await _dio.getDataAsMap(
      '${AppUrl.pokemonDetailUrl}?limit=$_limit&offset=$start',
    );

    var pokemonList = (pokemonListResponse['results'] as List<dynamic>)
        .map((e) => PokemonListModel.fromJson(e))
        .toList();

    return pokemonList;
  }

  Future<void> saveOfflineData(
      List<PokemonListModel> pokemonModel, int offset) async {
    await sembastUtil.saveData(
      id: offset,
      data: {
        'results': pokemonModel.map((e) => e.toJson()).toList(),
      },
    );
  }

  Future<List<PokemonListModel>?> getOfflineData(int offset) async {
    var data = await sembastUtil.getData(id: offset);
    if (data == null) return null;

    var pokemonList = (data['results'] as List<dynamic>)
        .map((e) => PokemonListModel.fromJson(e))
        .toList();

    return pokemonList;
  }
}
