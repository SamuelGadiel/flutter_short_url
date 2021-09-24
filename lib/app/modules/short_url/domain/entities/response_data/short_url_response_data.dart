import 'package:equatable/equatable.dart';
import 'package:short_url_converter/app/modules/short_url/domain/entities/response_data/result_short_url_response_data.dart';

class ShortUrlResponseData extends Equatable {
  final bool? ok;
  final ResultShortUrlResponseData? result;

  ShortUrlResponseData({
    this.ok,
    this.result,
  });

  @override
  List<Object?> get props => [ok, result];
}
