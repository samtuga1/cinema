import '../screens/menu_screen.dart';
import '../widgets/menu_widget.dart';
import '../widgets/movie_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/movie.dart';
import '../constants.dart' as constants;

class FavoriteMovies extends StatelessWidget {
  static const routName = '/fav_screen';
  const FavoriteMovies({Key key}) : super(key: key);

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
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
                future:
                    Provider.of<Movies>(context, listen: false).getFavMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('error');
                  } else {
                    return Consumer<Movies>(
                      builder: (context, movieData, _) => GridView.builder(
                        itemCount: movieData.favMovies.length,
                        itemBuilder: ((context, i) => MovieContainer(
                              description: movieData.favMovies[i].description,
                              releaseDate: movieData.favMovies[i].releaseDate,
                              id: movieData.favMovies[i].id,
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500${movieData.favMovies[i].imageUrl}',
                              rate: movieData.favMovies[i].rate,
                              title: movieData.favMovies[i].title,
                            )),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                          mainAxisSpacing: 0.0,
                        ),
                      ),
                    );
                  }
                }),
          )),
    );
  }
}
