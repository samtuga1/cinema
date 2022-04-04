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
            height: deviceHeight * 0.42,
            width: double.infinity,
            child: Image.network(
              movie.imageUrl!,
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
          Consumer<Movie>(
            builder: (context, movie, _) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    movie.toggleFavorite();
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: movie.isFavorite ? Colors.pink : null,
                  ),
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
                      movie.title!,
                      style: constants.TextStyles.text1,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Wrap(
                              children: List<Icon>.generate(
                                movie.rate!.floor(),
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
                            movie.duration!,
                            style: constants.TextStyles.text2.copyWith(
                              color: Colors.pink,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        Text(
                          movie.description!,
                          style: constants.TextStyles.text2,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    )),
                    Container(
                      margin: const EdgeInsets.only(top: 12, bottom: 8),
                      child: Text(
                        'Casts',
                        style: constants.TextStyles.text1,
                      ),
                    ),
                    Container(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movie.casts!.length,
                        itemBuilder: (context, i) => Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                movie.casts![i].imageUrl,
                                height: 100,
                                width: 85,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              movie.casts![i].name,
                              style: constants.TextStyles.text2,
                            )
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
