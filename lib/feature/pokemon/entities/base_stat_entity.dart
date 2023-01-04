import 'package:equatable/equatable.dart';

class BaseStatEntity extends Equatable {
  final String name;
  final String label;
  final int value;

  const BaseStatEntity({
    required this.name,
    required this.value,
    required this.label,
  });

  @override
  List<Object?> get props => [];

  static String getLabel(String name) {
    switch (name) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'Attack';
      case 'defense':
        return 'Defense';
      case 'special-attack':
        return 'Sp. Attack';
      case 'special-defense':
        return 'Sp. Defense';
      case 'speed':
        return 'Speed';
      default:
        return '';
    }
  }
}
