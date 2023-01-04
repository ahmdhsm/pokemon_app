import 'package:pokemon_app/feature/pokemon.bak/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.id,
    required super.name,
    required super.type,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    var urlArr = json['url'].toString().split('/');
    return PokemonModel(
      id: int.parse(urlArr[urlArr.length - 2]),
      name: json['name'],
      type: [],
    );
  }
}
