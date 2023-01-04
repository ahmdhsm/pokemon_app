import '../../entities/pokemon_entity.dart';

enum PokemonListStateEnum {
  loading,
  success,
}

class PokemonListState {
  late PokemonListStateEnum eventType;

  PokemonListState.loading() {
    this.eventType = PokemonListStateEnum.loading;
  }

  PokemonListState.success(List<PokemonEntity> data) {
    this.eventType = PokemonListStateEnum.loading;
  }
}
