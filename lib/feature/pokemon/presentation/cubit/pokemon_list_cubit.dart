import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/online_data.dart';
import '../../usecases/get_data.dart';
import '../state/pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListStateEnum> {
  PokemonListCubit(super.initialState);

  void tes() {
    emit(PokemonListStateEnum.loading);
    // GetData().call().then(
    //       (value) => value.fold(
    //         (l) => [],
    //         (r) => emit(PokemonListStateEnum.success),
    //       ),
    //     );
  }
}
