import 'package:dio/dio.dart';
import 'package:pokemon_app/const/app_url.dart';

class DioUtil {
  final _dio = Dio();

  DioUtil() {
    _dio.options.baseUrl = AppUrl.baseUrl;
  }

  Future<Response> get(String url) async {
    var response = await _dio.get(url);
    return response;
  }

  Future<Map<String, dynamic>> getDataAsMap(String url) async {
    var response = await get(url);
    return response.data;
  }
}
