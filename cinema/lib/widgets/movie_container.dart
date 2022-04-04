import 'package:cinema/screens/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart' as constants;

class MovieContainer extends StatelessWidget {
  final String? id;
  final String? imageUrl;
  final int? rate;
  final String? title;
  const MovieContainer({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.rate,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(MovieDetailScreen.routeName, arguments: id);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl!,
            fit: BoxFit.cover,
            height: 130,
            width: 117,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 3.5),
        child: Text(
          title!,
          style: constants.TextStyles.text2,
        ),
      ),
      Text(
        '$rate.0/10',
        style: constants.TextStyles.text2,
      ),
    ]);
  }
}
