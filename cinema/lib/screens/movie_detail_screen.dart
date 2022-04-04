import 'package:cinema/providers/movie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart' as constants;

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movie_detail_screen';

  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final movieId = ModalRoute.of(context)?.settings.arguments as String;
    final movie = Provider.of<Movies>(context).findById(movieId);
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          SizedBox(
            height: deviceHeight * 0.427,
            width: double.infinity,
            child: Image.network(
              movie.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Column(children: [
                Text(
                  movie.title, style: constants.TextStyles.text1,
                  textAlign: TextAlign.left,
                  ),
                  Wrap(
                    children: List<Text>.generate(
                    movie.rate.floor(), (index) => const Text('⭐'),
                      ),)
                ],),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
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
