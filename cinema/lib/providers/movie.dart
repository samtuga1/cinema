import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tmdb_api/tmdb_api.dart';

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
  List<Movie> _movies = [];
  List<Movie> _trendingMovies = [];
  List<Movie> _discoverMovies = [];

  List<Movie> get trendingMovies {
    return _trendingMovies;
  }

  List<Movie> get discoverMovies {
    return _discoverMovies;
  }

  Movie findSingleById(String? id) {
    return _movies.firstWhere((movie) => movie.id == id);
  }

  List<Movie> showFavMovies() {
    return _movies.where((movie) => movie.isFavorite == true).toList();
  }

  Future<void> loadMovies() async {
    const _apiKey = 'fea6af77e4406e51f9d36692af5620c4';
    const _readAccessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZWE2YWY3N2U0NDA2ZTUxZjlkMzY2OTJhZjU2MjBjNCIsInN1YiI6IjYyNGRmOWRmOTAyMDEyMDA5ZDY2NTFmZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EKVQ649G0Y4a9ADoej11Sa0p8kTx6Ej6vaY0-G-PkUA';
    List<Movie> loadedTrendingMovies = [];
    List<Movie> loadedDiscoverMovies = [];
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(_apiKey, _readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    try {
      final trendingMoviesResponse =
          await tmdbWithCustomLogs.v3.trending.getTrending();
      final discoverMoviesResponse =
          await tmdbWithCustomLogs.v3.discover.getMovies();
      final trendingReults = trendingMoviesResponse['results'] as List<dynamic>;
      final discoverResults =
          discoverMoviesResponse['results'] as List<dynamic>;
      for (var movieData in trendingReults) {
        loadedTrendingMovies.add(Movie(
          id: movieData['id'].toString(),
          title: movieData['original_title'] ?? 'Loading...',
          description: movieData['overview'] ?? 'Loading...',
          rate: movieData['vote_average'],
          releaseDate: movieData['release_date'],
          imageUrl: movieData['poster_path'],
        ));
      }
      for (var movieData in discoverResults) {
        loadedDiscoverMovies.add(Movie(
          id: movieData['id'].toString(),
          title: movieData['original_title'] ?? 'Loading...',
          description: movieData['overview'] ?? 'Loading...',
          rate: movieData['vote_average'],
          releaseDate: movieData['release_date'],
          imageUrl: movieData['poster_path'],
        ));
      }
      _trendingMovies = loadedTrendingMovies;
      _discoverMovies = loadedDiscoverMovies;
      _movies = _trendingMovies + _discoverMovies;
      print(_movies.first.title);
      notifyListeners();
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
