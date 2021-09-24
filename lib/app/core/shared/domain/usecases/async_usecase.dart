import 'package:dartz/dartz.dart';
import 'package:short_url_converter/app/core/shared/domain/errors/failures.dart';

abstract class AsyncUsecase<Type, Parameters> {
  AsyncUsecase();

  Future<Either<Failure, Type>> call(Parameters params);
}
