import 'package:dartz/dartz.dart';
import 'package:pokemon_app/feature/pokemon/domain/entities/pokemon_entity.dart';

import '../../../../core/error/failure.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemonList();
}
