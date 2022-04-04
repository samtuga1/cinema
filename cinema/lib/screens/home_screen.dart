import 'package:card_swiper/card_swiper.dart';
import '../constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie.dart';
import '../widgets/movie_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final movieData = Provider.of<Movies>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.black38,
                      ),
                      height: 44,
                      child: const TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(3.5),
                      child: IconButton(
                        splashRadius: 26,
                        color: Colors.grey,
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Movies', style: constants.TextStyles.text1),
                ],
              ),
            ),
            Expanded(
              child: Swiper(
                itemBuilder: (BuildContext context, int i) {
                  return MovieContainer(
                    height: 220,
                    width: 170,
                    imageUrl: movieData.movies[i].imageUrl,
                    id: movieData.movies[i].id,
                    rate: movieData.movies[i].rate,
                    title: movieData.movies[i].title,
                    duration: movieData.movies[i].duration,
                  );
                },
                itemCount: movieData.movies.length,
                viewportFraction: 0.38,
                scale: 0.8,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Trending',
                  style: constants.TextStyles.text1,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                itemCount: movieData.movies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) => Row(
                  children: [
                    MovieContainer(
                      height: 130,
                      width: 110,
                      id: movieData.movies[i].id,
                      imageUrl: movieData.movies[i].imageUrl,
                      rate: movieData.movies[i].rate,
                      title: movieData.movies[i].title,
                      duration: movieData.movies[i].duration,
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
