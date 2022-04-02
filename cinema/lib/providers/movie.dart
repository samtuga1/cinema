import '../providers/cast.dart';

class Movie {
  final String title;
  final String imageUrl;
  final String description;
  final int rate;
  List<Cast> casts;
  final String duration;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.rate,
    required this.casts,
    required this.duration,
  });
}
