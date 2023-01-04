import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';
import '../usecases/pokemon_data.dart';

class OnlineData {
  @override
  Future<Either<Failure, List<dynamic>>> call(int start) async {
    var dio = Dio();
    try {
      var response = await dio
          .get('https://pokeapi.co/api/v2/pokemon?limit=20&offset=$start');
      var json = response.data as Map<String, dynamic>;
      return right(json['results'] as List<dynamic>);
    } catch (e) {
      return left(Failure());
    }
  }
}
