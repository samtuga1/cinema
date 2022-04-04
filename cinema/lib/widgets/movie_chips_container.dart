import 'package:flutter/material.dart';
import '../constants.dart' as constants;

class MovieChipContainer extends StatefulWidget {
  final String? name;
  final int? chipIndex;
  const MovieChipContainer({
    Key? key,
    required this.chipIndex,
    required this.name,
  }) : super(key: key);

  @override
  State<MovieChipContainer> createState() => _MovieChipsState();
}

class _MovieChipsState extends State<MovieChipContainer> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {},
        child: Chip(
          backgroundColor: isSelected ? Colors.purple : Colors.grey,
          label: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              widget.name!,
              style: constants.TextStyles.text2,
            ),
          ),
        ),
      ),
    );
  }
}
