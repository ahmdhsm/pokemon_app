import 'package:dio/dio.dart';
import 'package:pokemon_app/feature/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_app/feature/pokemon/domain/repositories/pokemon_repository.dart';

import '../models/pokemon_model.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  @override
  Future<List<PokemonEntity>> getPokemonList() async {
    var dio = Dio();
    List<PokemonModel> pokemonList = [];
    try {
      var response =
          await dio.get('https://pokeapi.co/api/v2/pokemon?limit=20&offset=0');
      var json = response.data as Map<String, dynamic>;
      for (var pokemon in json['results']) {
        pokemonList.add(PokemonModel.fromJson(pokemon));
      }
      print('aaa');
      return pokemonList;
    } catch (e) {
      print('bb');
    }
    return pokemonList;
  }
}
