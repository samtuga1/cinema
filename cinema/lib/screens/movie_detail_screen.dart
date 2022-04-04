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
            height: deviceHeight * 0.43,
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: constants.TextStyles.text1,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          width: 100,
                          child: Wrap(
                            children: List<Text>.generate(
                              movie.rate.floor(),
                              (index) => const Text('⭐'),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(movie.duration),
                      ],
                    ),
                    Expanded(
                        child: ListView(
                      children: [Text(movie.description!)],
                    )),
                    Text(
                      'Cast',
                    ),
                    Container(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movie.casts!.length,
                        itemBuilder: (context, i) => Column(
                          children: [
                            Container(
                                height: 100,
                                width: 85,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.network(
                                  movie.casts![i].imageUrl,
                                )),
                            Text(movie.casts![i].name)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              alignment: Alignment.bottomCenter,
              height: deviceHeight * 0.58,
            ),
          )
        ],
      ),
    );
  }
}
