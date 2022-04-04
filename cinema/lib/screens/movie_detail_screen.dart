import 'package:cinema/providers/movie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movie_detail_screen';

  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    //final movieId = ModalRoute.of(context)?.settings.arguments as String;
    //final movie = Provider.of<Movies>(context).findById(movieId);
    //print(movie.title);
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          SizedBox(
            height: deviceHeight * 0.427,
            width: double.infinity,
            child: Image.network(
              'https://images.pexels.com/photos/10410155/pexels-photo-10410155.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              alignment: Alignment.bottomCenter,
              height: deviceHeight * 0.6,
            ),
          )
        ],
      ),
    );
  }
}
