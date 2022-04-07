import 'package:card_swiper/card_swiper.dart';
import 'package:cinema/screens/menu_screen.dart';
import 'package:cinema/widgets/menu_widget.dart';
import '../constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie.dart';
import '../widgets/movie_chips_container.dart';
import '../widgets/movie_container.dart';
import '../widgets/movie_type.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      setMoviesList();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  Future<void> setMoviesList() async {
    await Provider.of<Movies>(context).getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<Movies>(context, listen: false);
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      menuScreen: const MenuScreen(),
      mainScreen: Scaffold(
        appBar: AppBar(
          leading: const MenuWidget(),
          title: Text(
            'Cinema App',
            style: constants.TextStyles.textstyle,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const MovieChipContainer(),
              movieType('Top Trends'),
              SizedBox(
                height: 195,
                child: FutureBuilder(
                    future: setMoviesList(),//movieData.getTrendingMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return Swiper(
                          itemBuilder: (BuildContext context, i) {
                            return ChangeNotifierProvider(
                              create: (context) => Movie(),
                              child: MovieContainer(
                                imageUrl: movieData.movies[i].imageUrl,
                                id: movieData.movies[i].id,
                                rate: movieData.movies[i].rate,
                                title: movieData.movies[i].title,
                              ),
                            );
                          },
                          itemCount: movieData.movies.length,
                          viewportFraction: 0.25,
                          scale: 0.4,
                        );
                      } else {
                        return Text('Erroe');
                      }
                    }),
              ),
              // movieType('Movies'),
              // SizedBox(
              //   height: 195,
              //   child: Swiper(
              //     itemBuilder: (BuildContext context, i) {
              //       return MovieContainer(
              //         imageUrl: movieData.movies[i].imageUrl,
              //         id: movieData.movies[i].id,
              //         rate: movieData.movies[i].rate,
              //         title: movieData.movies[i].title,
              //       );
              //     },
              //     itemCount: movieData.movies.length,
              //     viewportFraction: 0.25,
              //     scale: 0.4,
              //   ),
              // ),
              // movieType('Tv Series'),
              // SizedBox(
              //   height: 195,
              //   child: Swiper(
              //     itemBuilder: (BuildContext context, i) {
              //       return MovieContainer(
              //         imageUrl: movieData.movies[i].imageUrl,
              //         id: movieData.movies[i].id,
              //         rate: movieData.movies[i].rate,
              //         title: movieData.movies[i].title,
              //       );
              //     },
              //     itemCount: movieData.movies.length,
              //     viewportFraction: 0.25,
              //     scale: 0.4,
              //   ),
              // ),
            ],
          ),
        )),
      ),
      //slideWidth: MediaQuery.of(context).size.width * (ZoomDrawer.isRTL() ? .45 : 0.65),
    );
  }
}
