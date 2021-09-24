abstract class ShortUrlValidators {
  bool hasInvalidCompleteUrl(String url);
}

class ShortUrlValidatorsImplementation implements ShortUrlValidators {
  @override
  bool hasInvalidCompleteUrl(String url) {
    return url == '';
  }
}
