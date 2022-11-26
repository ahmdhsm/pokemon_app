import 'package:pokemon_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/usecase/usecase.dart';
import 'package:pokemon_app/feature/pokemon/domain/repositories/pokemon_repository.dart';

import '../entities/pokemon_entity.dart';

class GetPokemonListUsecase extends Usecase<List<PokemonEntity>, NoParams> {
  final PokemonRepository repository;

  GetPokemonListUsecase(this.repository);

  @override
  Future<List<PokemonEntity>> call(params) async {
    final result = await repository.getPokemonList();
    return result;
  }
}
