import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../providers/movie.dart';
import 'package:provider/provider.dart';
import '../widgets/movie_container.dart';

class MoviesListView extends StatefulWidget {
  final String? movieType;
  const MoviesListView({
    Key? key,
    this.movieType,
  }) : super(key: key);

  @override
  State<MoviesListView> createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView> {
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    if (Provider.of<Movies>(context, listen: false).trendingMovies.isEmpty) {
      print('load');
      setState(() {
        _isLoading = true;
      });
      Provider.of<Movies>(context, listen: false).loadMovies().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    } else {
      return;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<Movies>(context, listen: false);
    return SizedBox(
      height: 215,
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Swiper(
              itemBuilder: (ctx, i) {
                if (widget.movieType == 'trending') {
                  return MovieContainer(
                    releaseDate: movieData.trendingMovies[i].releaseDate,
                    description: movieData.trendingMovies[i].description,
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${movieData.trendingMovies[i].imageUrl}',
                    id: movieData.trendingMovies[i].id,
                    rate: movieData.trendingMovies[i].rate,
                    title: movieData.trendingMovies[i].title,
                  );
                } else if (widget.movieType == 'discover') {
                  return MovieContainer(
                    releaseDate: movieData.trendingMovies[i].releaseDate,
                    description: movieData.trendingMovies[i].description,
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${movieData.discoverMovies[i].imageUrl}',
                    id: movieData.discoverMovies[i].id,
                    rate: movieData.discoverMovies[i].rate,
                    title: movieData.discoverMovies[i].title,
                  );
                } else if (widget.movieType == 'top rated') {
                  return MovieContainer(
                    releaseDate: movieData.topRatedMovies[i].releaseDate,
                    description: movieData.topRatedMovies[i].description,
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${movieData.topRatedMovies[i].imageUrl}',
                    id: movieData.topRatedMovies[i].id,
                    rate: movieData.topRatedMovies[i].rate,
                    title: movieData.topRatedMovies[i].title,
                  );
                } else if (widget.movieType == 'tv popular') {
                  return MovieContainer(
                    releaseDate: movieData.tvPopular[i].releaseDate,
                    description: movieData.tvPopular[i].description,
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${movieData.tvPopular[i].imageUrl}',
                    id: movieData.tvPopular[i].id,
                    rate: movieData.tvPopular[i].rate,
                    title: movieData.tvPopular[i].title,
                  );
                } else {
                  return const Text('No movie Type specified');
                }
              },
              itemCount: movieData.trendingMovies.length,
              viewportFraction: 0.25,
              scale: 0.4,
            ),
    );
  }
}
