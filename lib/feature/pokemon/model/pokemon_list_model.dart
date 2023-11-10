class PokemonListModel {
  final int id;
  final String name;
  final String url;

  const PokemonListModel({
    required this.id,
    required this.name,
    required this.url,
  });

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    var urlArr = json['url'].toString().split('/');
    return PokemonListModel(
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
}
