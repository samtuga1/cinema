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
  
  late bool _isLoading;
  @override
  void didChangeDependencies() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Movies>(context, listen: false).loadMovies().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<Movies>(context, listen: false);
    return SizedBox(
            height: 195,
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
                } else {
                  return const  Text('No movie Type specified');
                }
              },
              itemCount: movieData.trendingMovies.length,
              viewportFraction: 0.25,
              scale: 0.4,
            ),
       );
  }
}
