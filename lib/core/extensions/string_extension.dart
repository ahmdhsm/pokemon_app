extension StringExtension on String {
  String toCamelCase() {
    String data = this;
    String finalData = '';
    data = data.replaceAll('-', ' ');

    for (var text in data.split(' ')) {
      finalData +=
          "${text[0].toUpperCase()}${text.substring(1).toLowerCase()} ";
    }
    return finalData;
  }

  String baseStatLabel() {
    switch (this) {
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
