import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:short_url_converter/app/modules/short_url/domain/entities/parameters/short_url_parameters.dart';
import 'package:short_url_converter/app/modules/short_url/domain/entities/response_data/short_url_response_data.dart';
import 'package:short_url_converter/app/modules/short_url/domain/errors/invalid_complete_url_parameter_failure.dart';
import 'package:short_url_converter/app/modules/short_url/domain/repositories/short_url_repository.dart';
import 'package:short_url_converter/app/modules/short_url/domain/usecases/get_shorten_url_by_complete_url_usecase.dart';
import 'package:short_url_converter/app/modules/short_url/utils/validators/short_url_validators.dart';

class ShortUrlRepositoryMock extends Mock implements ShortUrlRepository {}

class ShortUrlParametersFake extends Fake implements ShortUrlParameters {}

// class ShortUrlResponseDataFake extends Fake implements ShortUrlResponseData {}

class InvalidCompleteUrlParameterFailureFake extends Fake implements InvalidCompleteUrlParameterFailure {}

void main() {
  late ShortUrlRepositoryMock repository;
  late GetShortenUrlByCompleteUrl usecase;
  final validators = ShortUrlValidatorsImplementation();

  // final shortUrlResponseDataFake = ShortUrlResponseDataFake();
  final completeUrlFailure = InvalidCompleteUrlParameterFailureFake();

  setUp(() {
    registerFallbackValue(ShortUrlParametersFake());
    // registerFallbackValue(shortUrlResponseDataFake);
    registerFallbackValue(ShortUrlResponseData());
    registerFallbackValue(completeUrlFailure);

    repository = ShortUrlRepositoryMock();
    usecase = GetShortenUrlByCompleteUrl(repository, validators);
  });

  final shortUrlParametersMock = ShortUrlParameters(url: 'www.google.com.br');
  final completeUrlFailureParameter = ShortUrlParameters(url: '');

  test('Must return a ShortUrlResponseData entity', () async {
    when(() => repository(any())).thenAnswer((invocation) async => Right(ShortUrlResponseData()));

    final result = await usecase(shortUrlParametersMock);

    expect(result.fold(id, id), isA<ShortUrlResponseData>());
  });

  test('Must return an InvalidCompleteUrlParameterFailure failure', () async {
    when(() => repository(any())).thenAnswer((invocation) async => Left(completeUrlFailure));

    final result = await usecase(completeUrlFailureParameter);

    expect(result.fold(id, id), isA<InvalidCompleteUrlParameterFailure>());
  });
}
