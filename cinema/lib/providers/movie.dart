import 'package:flutter/cupertino.dart';

import '../providers/cast.dart';

class Movie {
  final String? id;
  final String title;
  final String imageUrl;
  final String? description;
  final int rate;
  List<Cast>? casts;
  final String duration;

  Movie({
    this.id,
    required this.title,
    required this.imageUrl,
    this.description,
    required this.rate,
    this.casts,
    required this.duration,
  });
}

class Movies with ChangeNotifier {
  List<Movie> _movies = [
    Movie(
      id: 'm1',
        imageUrl:
            'https://images.pexels.com/photos/11387289/pexels-photo-11387289.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        title: 'Ant-Man',
        duration: '1hr 30min',
        rate: 3),
    Movie(
      id: 'm2',
        imageUrl:
            'https://images.pexels.com/photos/10594054/pexels-photo-10594054.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        title: 'Ant-Man',
        duration: '1hr 30min',
        rate: 3),
    Movie(
      id: 'm3',
        imageUrl:
            'https://images.pexels.com/photos/10025734/pexels-photo-10025734.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        title: 'Ant-Man',
        duration: '1hr 30min',
        rate: 3),
  ];

  List<Movie> get movies {
    return _movies;
  }

  Movie findById(String? id) {
   return _movies.firstWhere((movie) => movie.id == id);
  }
}
