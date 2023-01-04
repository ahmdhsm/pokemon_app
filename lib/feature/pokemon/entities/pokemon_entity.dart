import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final String url;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.url,
  });

  factory PokemonEntity.fromJson(Map<String, dynamic> json) {
    var urlArr = json['url'].toString().split('/');
    return PokemonEntity(
      url: json['url'],
      id: int.parse(urlArr[urlArr.length - 2]),
      name: json['name'],
    );
  }

  toJson() {
    return {
      'url': url,
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [id, name];
}
