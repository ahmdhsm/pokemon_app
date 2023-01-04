import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokemon_app/feature/pokemon/entities/pokemon_detail_entity.dart';

import '../../../core/error/failure.dart';

class PokemonDetailData {
  Future<Either<Failure, PokemonDetailEntity>> call(int id) async {
    var dio = Dio();
    try {
      var response = await dio.get('https://pokeapi.co/api/v2/pokemon/$id/');
      var json = response.data as Map<String, dynamic>;
      return right(PokemonDetailEntity.fromJsonResponse(json));
    } catch (e) {
      return left(Failure());
    }
  }
}
