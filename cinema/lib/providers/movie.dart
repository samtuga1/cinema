import 'package:flutter/cupertino.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Movie with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final dynamic rate;
  final String releaseDate;
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
  Future<void> toggleFavorite(Movie movie) async {
    movie.isFavorite = !movie.isFavorite;
    notifyListeners();
    const url =
        'https://cinema-a0068-default-rtdb.firebaseio.com/favoriteMovies.json';

    if (movie.isFavorite) {
      try {
        final response = await http.post(
          Uri.parse(url),
          body: json.encode(
            {
              'id': movie.id,
              'title': movie.title,
              'description': movie.description,
              'isFavorite': movie.isFavorite,
              'imageUrl': movie.imageUrl,
              'rate': movie.rate,
              'releaseDate': movie.releaseDate,
            },
          ),
        );
        if (response.statusCode >= 400) {
          return;
        }
      } catch (error) {
        rethrow;
      }
    } else {
      try {
        await http.delete(Uri.parse(url));
      } catch (error) {
        rethrow;
      }
    }
  }

  bool fav(Movie mov) => mov.isFavorite;
}

class Movies with ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> _favoriteMovies = [];
  List<Movie> _trendingMovies = [];
  List<Movie> _discoverMovies = [];
  List<Movie> _topRatedMovies = [];
  List<Movie> _tvPopular = [];

  List<Movie> get trendingMovies {
    return _trendingMovies;
  }

  List<Movie> get favMovies {
    return _favoriteMovies;
  }

  List<Movie> get discoverMovies {
    return _discoverMovies;
  }

  List<Movie> get topRatedMovies {
    return _topRatedMovies;
  }

  List<Movie> get tvPopular {
    return _tvPopular;
  }

  Movie findSingleById(String id) {
    return _movies.firstWhere((movie) => movie.id == id);
  }

  Future<void> getFavMovies() async {
    const url =
        'https://cinema-a0068-default-rtdb.firebaseio.com/favoriteMovies.json';
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode >= 400) {
        return;
      }
      if (response.body == null) {
        return;
      }
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      List<Movie> loadedMovies = [];
      extractedData.forEach((movieId, movieData) {
        loadedMovies.add(Movie(
            id: movieData['id'],
            title: movieData['title'],
            description: movieData['description'],
            isFavorite: movieData['isFavorite'],
            imageUrl: movieData['imageUrl'],
            rate: ((movieData['rate'] / 10) * 5).round(),
            releaseDate: movieData['releaseDate']));
      });
      _favoriteMovies = loadedMovies;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> loadMovies() async {
    const _apiKey = 'fea6af77e4406e51f9d36692af5620c4';
    const _readAccessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZWE2YWY3N2U0NDA2ZTUxZjlkMzY2OTJhZjU2MjBjNCIsInN1YiI6IjYyNGRmOWRmOTAyMDEyMDA5ZDY2NTFmZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EKVQ649G0Y4a9ADoej11Sa0p8kTx6Ej6vaY0-G-PkUA';
    List<Movie> loadedTrendingMovies = [];
    List<Movie> loadedDiscoverMovies = [];
    List<Movie> loadedtopRatedMovies = [];
    List<Movie> loadedTvPopular = [];
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
      final topRatedMoviesResponse =
          await tmdbWithCustomLogs.v3.tv.getTopRated();
      final tvPopularResponse = await tmdbWithCustomLogs.v3.tv.getPopular();
      final trendingReults = trendingMoviesResponse['results'] as List<dynamic>;
      final discoverResults =
          discoverMoviesResponse['results'] as List<dynamic>;
      final topRatedResults =
          topRatedMoviesResponse['results'] as List<dynamic>;
      final tvPopularResults = tvPopularResponse['results'] as List<dynamic>;
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
      for (var movieData in topRatedResults) {
        loadedtopRatedMovies.add(Movie(
          id: movieData['id'].toString(),
          title: movieData['original_name'] ?? 'Loading...',
          description: movieData['overview'] ?? 'Loading...',
          rate: movieData['vote_average'],
          releaseDate: movieData['first_air_date'] ?? '',
          imageUrl: movieData['poster_path'],
        ));
      }
      for (var movieData in tvPopularResults) {
        loadedTvPopular.add(Movie(
          id: movieData['id'].toString(),
          title: movieData['original_name'] ?? 'Loading...',
          description: movieData['overview'] ?? 'Loading...',
          rate: movieData['vote_average'],
          releaseDate: movieData['first_air_date'] ?? '',
          imageUrl: movieData['poster_path'],
        ));
      }
      _trendingMovies = loadedTrendingMovies;
      _discoverMovies = loadedDiscoverMovies;
      _topRatedMovies = loadedtopRatedMovies;
      _tvPopular = loadedTvPopular;
      _movies =
          _trendingMovies + _discoverMovies + _topRatedMovies + _tvPopular;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
