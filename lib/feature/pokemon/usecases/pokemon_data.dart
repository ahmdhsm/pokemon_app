import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';

abstract class PokemonData {
  Future<Either<Failure, dynamic>> call();
}
