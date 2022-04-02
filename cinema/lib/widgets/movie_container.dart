import 'package:flutter/material.dart';

class MovieContainer extends StatelessWidget {
  final String imageUrl;
  final int rate;
  final String title;
  const MovieContainer(
      {Key? key,
      required this.imageUrl,
      required this.rate,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Image.network(imageUrl),
      )
    ]);
  }
}
