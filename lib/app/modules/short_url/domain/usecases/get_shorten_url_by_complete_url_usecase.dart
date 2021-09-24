import 'package:short_url_converter/app/core/shared/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:short_url_converter/app/core/shared/domain/usecases/async_usecase.dart';
import 'package:short_url_converter/app/modules/short_url/domain/entities/parameters/short_url_parameters.dart';
import 'package:short_url_converter/app/modules/short_url/domain/entities/response_data/short_url_response_data.dart';
import 'package:short_url_converter/app/modules/short_url/domain/errors/invalid_complete_url_parameter_failure.dart';
import 'package:short_url_converter/app/modules/short_url/domain/repositories/short_url_repository.dart';
import 'package:short_url_converter/app/modules/short_url/utils/validators/short_url_validators.dart';

abstract class GetShortenUrlByCompleteUrlAbstraction implements AsyncUsecase<ShortUrlResponseData, ShortUrlParameters> {}

class GetShortenUrlByCompleteUrl implements GetShortenUrlByCompleteUrlAbstraction {
  final ShortUrlRepository repository;
  final ShortUrlValidators validators;

  GetShortenUrlByCompleteUrl(this.repository, this.validators);

  @override
  Future<Either<Failure, ShortUrlResponseData>> call(ShortUrlParameters shortUrlParameters) async {
    if (validators.hasInvalidCompleteUrl(shortUrlParameters.url)) {
      return Left(InvalidCompleteUrlParameterFailure('A URL não pode ser vazia'));
    }

    return await repository(shortUrlParameters);
  }
}
