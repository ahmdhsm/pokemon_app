import 'package:flutter/foundation.dart';
import 'package:pokemon_app/feature/pokemon/entities/pokemon_entity.dart';

import '../../data/online_data.dart';
import '../../usecases/get_data.dart';

class PokemonListNotifier extends ChangeNotifier {
  PokemonListNotifier() {
    tes();
  }

  List<PokemonEntity> pokemonList = [];
  int offset = 0;

  bool isLoading = false;

  void tes() async {
    if (isLoading == true) {
      return;
    }

    isLoading = true;
    notifyListeners();

    var tes = await GetData().tes(offset);
    await tes.fold(
      (l) {
        notifyListeners();
      },
      (r) async {
        await Future.delayed(Duration(seconds: 1));
        pokemonList.addAll(r);
        notifyListeners();
      },
    );
    offset += 20;

    isLoading = false;
    notifyListeners();
  }
}
