import 'package:fpdart/fpdart.dart';
import 'package:pokemon_app/core/error/failure.dart';
import 'package:pokemon_app/feature/pokemon/data/pokemon_list_data.dart';
import 'package:pokemon_app/feature/pokemon/model/pokemon_list_model.dart';

class PokemonListUsecase {
  final _pokemonListData = PokemonListData();

  Future<Either<Failure, List<PokemonListModel>>> getPokemonDetail(
    int offset,
  ) async {
    try {
      var onlineData = await _pokemonListData.getOnlineData(
        offset,
      );

      await _pokemonListData.saveOfflineData(onlineData, offset);

      return right(onlineData);
    } catch (e) {
      return left(Failure());
    }
  }

  Future<Either<Failure, List<PokemonListModel>?>> getOfflinePokemonList(
      int offset) async {
    try {
      var offlineData = await _pokemonListData.getOfflineData(offset);

      return right(offlineData);
    } catch (e) {
      return left(Failure());
    }
  }
}
