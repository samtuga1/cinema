import '../screens/menu_screen.dart';
import '../widgets/menu_widget.dart';
import '../widgets/movie_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/movie.dart';
import '../constants.dart' as constants;

class FavoriteMovies extends StatefulWidget {
  static const routName = '/fav_screen';
  const FavoriteMovies({Key? key}) : super(key: key);

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      menuScreen: const MenuScreen(),
      mainScreen: Scaffold(
        appBar: AppBar(
          leading: const MenuWidget(),
          title: Text('Favorites', style: constants.TextStyles.textstyle),
          centerTitle: true,
        ),
        body: Consumer<Movies>(
          builder: (context, movies, child) => GridView.builder(
            itemCount: movies.showFavMovies().length,
            itemBuilder: ((context, i) => MovieContainer(
                  id: movies.showFavMovies()[i].id,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${movies.showFavMovies()[i].imageUrl}',
                  rate: movies.showFavMovies()[i].rate,
                  title: movies.showFavMovies()[i].title,
                )),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
            ),
          ),
        ),
      ),
    );
  }
}
