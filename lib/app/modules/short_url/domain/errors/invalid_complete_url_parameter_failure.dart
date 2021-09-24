import 'package:short_url_converter/app/modules/short_url/domain/errors/short_url_failures.dart';

class InvalidCompleteUrlParameterFailure extends ShortUrlFailures {
  InvalidCompleteUrlParameterFailure(String message) : super(message);
}
