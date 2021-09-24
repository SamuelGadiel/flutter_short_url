import 'package:dartz/dartz.dart';
import 'package:short_url_converter/app/core/shared/domain/errors/failures.dart';

abstract class Usecase<Type, Parameters> {
  Usecase();

  Either<Failure, Type> call(Parameters params);
}
