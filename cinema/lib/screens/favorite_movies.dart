import 'package:cinema/widgets/movie_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie.dart';

class FavoriteMovies extends StatefulWidget {
  const FavoriteMovies({ Key? key }) : super(key: key);

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  @override
  Widget build(BuildContext context) {
    final favMovies = Provider.of<Movies>(context).showFavMovies();
    return Scaffold(
      body: GridView(
        children: favMovies,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        )
    );
  }
}