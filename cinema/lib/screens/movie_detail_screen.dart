import 'package:cinema/providers/movie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart' as constants;

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movie_detail_screen';

  const MovieDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final movieData =
        ModalRoute.of(context).settings.arguments as List<dynamic>;
    final singleMovie = Provider.of<Movies>(context, listen: false)
        .findSingleById(movieData[5]);
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          SizedBox(
            height: deviceHeight * 0.42,
            width: double.infinity,
            child: Image.network(
              movieData[3],
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_rounded),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Provider.of<Movie>(context, listen: false)
                      .toggleFavorite(singleMovie)
                      .catchError((error) {
                    print(error);
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: Provider.of<Movie>(context).fav(singleMovie)
                      ? Colors.pink
                      : null,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieData[0],
                      style: constants.TextStyles.text1,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Wrap(
                              children: List<Icon>.generate(
                                ((movieData[2] / 10) * 5)
                                    .round(), //rate! / 10) * 5
                                (index) => const Icon(
                                  Icons.star,
                                  color: Colors.pink,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Release : ${movieData[4] ?? 'Not found'}",
                            style: constants.TextStyles.text2.copyWith(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        Text(
                          movieData[1],
                          style: constants.TextStyles.text2,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
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
