import 'package:flutter/cupertino.dart';

import '../providers/cast.dart';

class Movie with ChangeNotifier {
  final String? id;
  final String? title;
  final String? imageUrl;
  final String? description;
  final int? rate;
  List<Cast>? casts;
  final String? duration;
  bool isFavorite;

  Movie({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.rate,
    this.casts,
    this.duration,
    this.isFavorite = false,
  });
  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class Movies with ChangeNotifier {
  final List<Movie> _movies = [
    Movie(
      casts: [
        Cast(
            name: 'Sam Twum',
            imageUrl:
                'https://images.pexels.com/photos/11387289/pexels-photo-11387289.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
      ],
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 'm1',
      imageUrl:
          'https://images.pexels.com/photos/11387289/pexels-photo-11387289.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      title: 'Ant-Man',
      duration: '1hr 30min',
      rate: 3,
    ),
    Movie(
        casts: [
          Cast(
              name: 'Sam Twum',
              imageUrl:
                  'https://images.pexels.com/photos/11387289/pexels-photo-11387289.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
        ],
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        id: 'm2',
        imageUrl:
            'https://images.pexels.com/photos/10594054/pexels-photo-10594054.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        title: 'Ant-Man',
        duration: '1hr 30min',
        rate: 3),
    Movie(
      casts: [
        Cast(
            name: 'Sam Twum',
            imageUrl:
                'https://images.pexels.com/photos/11387289/pexels-photo-11387289.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
      ],
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 'm3',
      imageUrl:
          'https://images.pexels.com/photos/10025734/pexels-photo-10025734.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      title: 'Ant-Man',
      duration: '1hr 30min',
      rate: 3,
    ),
  ];

  List<Movie> get movies {
    return _movies;
  }

  Movie findById(String? id) {
    return _movies.firstWhere((movie) => movie.id == id);
  }
}
