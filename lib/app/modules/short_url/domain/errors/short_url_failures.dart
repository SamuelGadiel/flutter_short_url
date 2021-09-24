import 'package:short_url_converter/app/core/shared/domain/errors/failures.dart';

abstract class ShortUrlFailures extends Failure {
  ShortUrlFailures(String message) : super(message);
}
