import 'package:pokemon_app/const/app_url.dart';
import 'package:pokemon_app/const/database_name.dart';
import 'package:pokemon_app/core/utils/dio_util.dart';
import 'package:pokemon_app/core/utils/sembast_util.dart';
import 'package:pokemon_app/feature/pokemon/model/pokemon_detail_model.dart';
import 'package:pokemon_app/feature/pokemon/model/pokemon_model.dart';
import 'package:pokemon_app/feature/pokemon/model/pokemon_spesies_detail_model.dart';

class PokemonDetailData {
  final dio = DioUtil();

  final sembastUtil = SembastUtil(
    databaseName: DatabaseName.pokemonDetailDatabase,
  );

  Future<PokemonModel> getOnlineData(int id) async {
    var pokemonDetailResponse = await dio.getDataAsMap(
      '${AppUrl.pokemonDetailUrl}/$id/',
    );

    var pokemonDetail = PokemonDetailModel.fromJson(pokemonDetailResponse);

    var speciesDetailResponse = await dio.getDataAsMap(
      pokemonDetail.species.url,
    );

    var species = PokemonSpesiesDetailModel.fromJson(speciesDetailResponse);

    return PokemonModel(
      pokemonDetailModel: pokemonDetail,
      pokemonSpesiesDetailModel: species,
    );
  }

  Future<void> saveOfflineData(PokemonModel pokemonModel) async {
    await sembastUtil.saveData(
      id: pokemonModel.pokemonDetailModel.id,
      data: pokemonModel.toJson(),
    );
  }

  Future<PokemonModel?> getOfflineData(int id) async {
    var data = await sembastUtil.getData(id: id);
    if (data == null) return null;
    return PokemonModel.fromJson(
      data,
    );
  }
}
