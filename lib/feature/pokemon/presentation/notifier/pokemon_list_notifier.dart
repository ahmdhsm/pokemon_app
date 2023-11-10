import 'package:flutter/foundation.dart';
import 'package:pokemon_app/feature/pokemon/model/pokemon_list_model.dart';
import 'package:pokemon_app/feature/pokemon/usecases/pokemon_list_usecase.dart';

class PokemonListNotifier extends ChangeNotifier {
  PokemonListNotifier() {
    getData();
  }

  final _pokemenListUseCase = PokemonListUsecase();

  List<PokemonListModel> pokemonList = [];
  int offset = 0;

  bool isLoading = false;

  void getData() async {
    if (isLoading == true) {
      return;
    }

    isLoading = true;
    notifyListeners();

    if (offset == 0) {
      var offlineData = await _pokemenListUseCase.getOfflinePokemonList(offset);
      offlineData.fold(
        (l) {},
        (r) async {
          if (r != null) {
            await Future.delayed(const Duration(milliseconds: 500));
            pokemonList.addAll(r);
            isLoading = false;
            notifyListeners();
          }
          return;
        },
      );
      offset = 20;
      return;
    }

    var onlineData = await _pokemenListUseCase.getPokemonDetail(offset);
    await onlineData.fold(
      (l) {
        notifyListeners();
      },
      (r) async {
        offset += 20;
        await Future.delayed(const Duration(seconds: 1));
        pokemonList.addAll(r);
        notifyListeners();
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
