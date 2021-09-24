import 'package:dartz/dartz.dart';
import 'package:short_url_converter/app/core/shared/domain/errors/failures.dart';
import 'package:short_url_converter/app/modules/short_url/domain/entities/parameters/short_url_parameters.dart';
import 'package:short_url_converter/app/modules/short_url/domain/entities/response_data/short_url_response_data.dart';

abstract class ShortUrlRepository {
  Future<Either<Failure, ShortUrlResponseData>> call(ShortUrlParameters shortUrlParameters);
}
