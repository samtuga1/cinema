import 'package:cinema/screens/menu_screen.dart';
import 'package:cinema/widgets/menu_widget.dart';
import '../constants.dart' as constants;
import 'package:flutter/material.dart';
import '../widgets/movie_type.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../widgets/movies_listview.dart';

class HomeScreen extends StatelessWidget {
  static const routName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              movieType('Top Trends'),
              const MoviesListView(movieType: 'trending',),
              movieType('Discover'),
              const MoviesListView(movieType: 'discover',),
              movieType('Tv top rated'),
              const MoviesListView(movieType: 'top rated',),
              movieType('Popular Tv shows'),
              const MoviesListView(movieType: 'tv popular',)
            ],
          ),
        )),
      ),
    );
  }
}
