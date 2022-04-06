import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../providers/cast.dart';

class Movie with ChangeNotifier {
  final String? id;
  final String? title;
  final String? imageUrl;
  final String? description;
  final double? rate;
  final String? releaseDate;
  bool isFavorite;

  Movie({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.rate,
    this.releaseDate,
    this.isFavorite = false,
  });
  void toggleFavorite(Movie movie) {
    movie.isFavorite = !movie.isFavorite;
    notifyListeners();
  }

  bool fav(Movie mov) => mov.isFavorite;
}

class Movies with ChangeNotifier {
  final List<Movie> _movies = [
    Movie(
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 'm1',
      imageUrl:
          'https://images.pexels.com/photos/11387289/pexels-photo-11387289.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      title: 'Ant-Man',
      releaseDate: '2021-12-15',
      rate: 3.6,
    ),
    Movie(
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        id: 'm2',
        imageUrl:
            'https://images.pexels.com/photos/10594054/pexels-photo-10594054.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        title: 'Ant-Man',
        releaseDate: '2021-12-15',
        rate: 3),
    Movie(
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 'm3',
      imageUrl:
          'https://images.pexels.com/photos/10025734/pexels-photo-10025734.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      title: 'Ant-Man',
      releaseDate: '2021-12-15',
      rate: 3,
    ),
  ];

  List<Movie> get movies {
    return _movies;
  }

  Movie findSingleById(String? id) {
    return _movies.firstWhere((movie) => movie.id == id);
  }

  List<Movie> showFavMovies() {
    return _movies.where((movie) => movie.isFavorite == true).toList();
  }

  Future<void> getTrendingMovies() async {
    List<String> movieTitles = [];
    List<String> movieImageUrls = [];
    List<String> movieDescriptions = [];
    List<String> movieReleaseDates = [];
    List<String> movieRates = [];
    List<String> movieCasts = [];
    List<String> movieIds = [];
    const _apiKey = 'fea6af77e4406e51f9d36692af5620c4';
    const url = 'https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode >= 400) {
        return;
      }
      final extractedData = json.decode(response.body);
      print(extractedData);
    } catch (error) {
      print(error);
    }
  }
}
