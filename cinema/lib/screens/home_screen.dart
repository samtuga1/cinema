import 'package:card_swiper/card_swiper.dart';
import 'package:cinema/providers/movie_chip.dart';
import '../constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie.dart';
import '../widgets/movie_chips_container.dart';
import '../widgets/movie_container.dart';
import '../widgets/movie_type.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<Movies>(context);
    final movieChips = Provider.of<MoviesChips>(context);
    return Scaffold(
      appBar: AppBar(
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
            // Container(
            //     margin: const EdgeInsets.only(top: 12),
            //     height: 40,
            //     child: ListView(
            //       children: [
            //         Container(
            //           margin: const EdgeInsets.only(right: 12),
            //           child: ChoiceChip(
            //             selectedColor: Colors.purple,
            //             onSelected: ((value) {
            //               _isSelected = value;
            //             }),
            //             selected: _isSelected,
            //             label: Padding(
            //               padding: const EdgeInsets.all(6.0),
            //               child: Text(
            //                 'All',
            //                 style: constants.TextStyles.text2,
            //               ),
            //             ),
            //           ),
            //         )
            //       ],
            //     )),
            // Padding(
            //padding: const EdgeInsets.only(),
            //child:
            // Row(
            //   children: [
            //     IconButton(
            //       icon: const Icon(Icons.menu),
            //       onPressed: () {},
            //     ),
            //     const SizedBox(
            //       width: 40,
            //     ),
            //     Expanded(
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(7),
            //           color: Colors.black38,
            //         ),
            //         height: 44,
            //         child: const TextField(
            //           cursorColor: Colors.grey,
            //           decoration: InputDecoration(
            //             border: OutlineInputBorder(
            //               borderSide: BorderSide.none,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 12.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.black12,
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         padding: const EdgeInsets.all(3.5),
            //         child: IconButton(
            //           splashRadius: 26,
            //           color: Colors.grey,
            //           icon: const Icon(Icons.search),
            //           onPressed: () {},
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            //),
            movieType('Top Trends'),
            SizedBox(
              height: 195,
              child: Swiper(
                itemBuilder: (BuildContext context, i) {
                  return MovieContainer(
                    imageUrl: movieData.movies[i].imageUrl,
                    id: movieData.movies[i].id,
                    rate: movieData.movies[i].rate,
                    title: movieData.movies[i].title,
                  );
                },
                itemCount: movieData.movies.length,
                viewportFraction: 0.25,
                scale: 0.4,
              ),
            ),
            movieType('Movies'),
            SizedBox(
              height: 195,
              child: Swiper(
                itemBuilder: (BuildContext context, i) {
                  return MovieContainer(
                    imageUrl: movieData.movies[i].imageUrl,
                    id: movieData.movies[i].id,
                    rate: movieData.movies[i].rate,
                    title: movieData.movies[i].title,
                  );
                },
                itemCount: movieData.movies.length,
                viewportFraction: 0.25,
                scale: 0.4,
              ),
            ),
            movieType('Tv Series'),
            SizedBox(
              height: 195,
              child: Swiper(
                itemBuilder: (BuildContext context, i) {
                  return MovieContainer(
                    imageUrl: movieData.movies[i].imageUrl,
                    id: movieData.movies[i].id,
                    rate: movieData.movies[i].rate,
                    title: movieData.movies[i].title,
                  );
                },
                itemCount: movieData.movies.length,
                viewportFraction: 0.25,
                scale: 0.4,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
