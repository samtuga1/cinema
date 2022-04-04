import 'package:flutter/material.dart';
import '../constants.dart' as constants;

class MovieChips extends StatelessWidget {
  final String name;
  const MovieChips({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Chip(
        backgroundColor: Colors.purple,
        label: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            name,
            style: constants.TextStyles.text2,
          ),
        ),
      ),
    );
  }
}