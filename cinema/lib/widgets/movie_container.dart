import 'package:cinema/screens/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart' as constants;

class MovieContainer extends StatelessWidget {
  final String description;
  final String releaseDate;
  final String id;
  final String imageUrl;
  final double rate;
  final String title;
  const MovieContainer({
    Key key,
    this.releaseDate,
    this.description,
    this.id,
    this.imageUrl,
    this.rate,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(MovieDetailScreen.routeName,
              arguments: [title, description, rate, imageUrl, releaseDate, id]);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 130,
            width: 117,
          ),
        ),
      ),
      SizedBox(
        height: 45,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 3.5),
          child: Text(
            title ?? 'Loading...',
            style: constants.TextStyles.text2,
          ),
        ),
      ),
      Text(
        //calculateRate().toString(),
        '${((rate / 10) * 5).round()}/5',
        style: constants.TextStyles.text2,
      ),
    ]);
  }
}
