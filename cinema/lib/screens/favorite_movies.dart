import 'package:cinema/widgets/movie_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie.dart';

class FavoriteMovies extends StatefulWidget {
  static const routName = '/fav_screen';
  const FavoriteMovies({Key? key}) : super(key: key);

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  @override
  Widget build(BuildContext context) {
    final favMovies = Provider.of<Movies>(context).showFavMovies();
    return Scaffold(
        body: GridView.builder(
          itemCount: favMovies.length,
      itemBuilder: ((context, i) => MovieContainer(
            id: favMovies[i].id,
            imageUrl: favMovies[i].imageUrl,
            rate: favMovies[i].rate,
            title: favMovies[i].title,
          )),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
    ));
  }
}
