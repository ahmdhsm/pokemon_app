extension StringExtension on String {
  String toCamelCase() {
    String data = this;
    String finalData = '';
    data = data.replaceAll('-', ' ');
    // return data;
    for (var tes in data.split(' ')) {
      finalData += "${tes[0].toUpperCase()}${tes.substring(1).toLowerCase()} ";
    }
    return finalData;
  }
}
