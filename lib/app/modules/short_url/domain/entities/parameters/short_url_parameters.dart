import 'package:equatable/equatable.dart';

class ShortUrlParameters extends Equatable {
  final String url;

  ShortUrlParameters({required this.url});

  @override
  List<Object?> get props => [url];
}
