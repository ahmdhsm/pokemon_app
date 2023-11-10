import 'package:fpdart/fpdart.dart';
import 'package:pokemon_app/core/error/failure.dart';
import 'package:pokemon_app/feature/pokemon/data/pokemon_detail_data.dart';
import 'package:pokemon_app/feature/pokemon/model/pokemon_model.dart';

class PokemonDetailUsecase {
  final pokemonDetailData = PokemonDetailData();

  Future<Either<Failure, PokemonModel?>> getOfflinePokemonDetail(
    int pokemonId,
  ) async {
    try {
      var offlineData = await pokemonDetailData.getOfflineData(pokemonId);

      return right(offlineData);
    } catch (e) {
      return left(Failure());
    }
  }

  Future<Either<Failure, PokemonModel>> getPokemonDetail(
    int pokemonId,
  ) async {
    try {
      var onlineData = await pokemonDetailData.getOnlineData(
        pokemonId,
      );
      await pokemonDetailData.saveOfflineData(onlineData);
      return right(onlineData);
    } catch (e) {
      return left(Failure());
    }
  }
}
