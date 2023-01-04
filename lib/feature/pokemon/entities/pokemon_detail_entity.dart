import 'package:equatable/equatable.dart';
import 'package:pokemon_app/feature/pokemon/entities/base_stat_entity.dart';

class PokemonDetailEntity extends Equatable {
  final List<BaseStatEntity> baseStatEntity;
  final List<String> types;
  final List<String> moves;
  final String name;
  final int id;

  const PokemonDetailEntity({
    required this.baseStatEntity,
    required this.name,
    required this.id,
    required this.types,
    required this.moves,
  });

  factory PokemonDetailEntity.fromJsonResponse(Map<String, dynamic> json) {
    List<BaseStatEntity> statEntity = [];
    List<String> types = [];
    List<String> moves = [];

    for (var stat in json['stats']) {
      statEntity.add(
        BaseStatEntity(
          value: stat['base_stat'],
          name: stat['stat']['name'],
          label: BaseStatEntity.getLabel(
            stat['stat']['name'],
          ),
        ),
      );
    }

    for (var type in json['types']) {
      types.add(type['type']['name']);
    }

    for (var move in json['moves']) {
      moves.add(move['move']['name']);
    }

    return PokemonDetailEntity(
      name: json['name'],
      id: json['id'],
      baseStatEntity: statEntity,
      types: types,
      moves: moves,
    );
  }

  @override
  List<Object?> get props => [];
}
