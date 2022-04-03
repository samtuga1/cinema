import 'package:flutter/material.dart';
import '../constants.dart' as constants;

class MovieContainer extends StatelessWidget {
  final String imageUrl;
  final int rate;
  final String title;
  final String duration;
  const MovieContainer({
    Key? key,
    required this.imageUrl,
    required this.rate,
    required this.title,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 220,
          width: 170,
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 3.5),
        child: Text(
          title,
          style: constants.TextStyles.text2,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '⭐ $rate',
            style: constants.TextStyles.text2,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            duration,
            style: constants.TextStyles.text2,
          ),
        ],
      )
    ]);
  }
}
