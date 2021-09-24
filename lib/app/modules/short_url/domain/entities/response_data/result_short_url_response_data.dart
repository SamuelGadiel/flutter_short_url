import 'package:equatable/equatable.dart';

class ResultShortUrlResponseData extends Equatable {
  final String? shortLinkCode;
  final String? shortLink;
  final String? completeShortLink;
  final String? alternativeShortLink;
  final String? completeAlternativeShortLink;
  final String? originalLink;

  ResultShortUrlResponseData({
    this.shortLinkCode,
    this.shortLink,
    this.completeShortLink,
    this.alternativeShortLink,
    this.completeAlternativeShortLink,
    this.originalLink,
  });

  @override
  List<Object?> get props => [
        shortLinkCode,
        shortLink,
        completeShortLink,
        alternativeShortLink,
        completeAlternativeShortLink,
        originalLink,
      ];
}
