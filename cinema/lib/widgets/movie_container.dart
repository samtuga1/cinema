import 'package:flutter/material.dart';

class MovieContainer extends StatelessWidget {
  final String imageUrl;
  final int rate;
  final String title;
  final String duration;
  const MovieContainer(
      {Key? key,
      required this.imageUrl,
      required this.rate,
      required this.title,
      required this.duration,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
        height: 60,
        width: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
      Text(title),
      Row(
        children: [
          Text('⭐ $rate'),
          const SizedBox(
            width: 10,
          ),
          Text(duration),
          ],
      )
    ]);
  }
}
