import 'package:flutter/material.dart';
import '../constants.dart' as constants;

class MovieChipContainer extends StatefulWidget {
  const MovieChipContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieChipContainer> createState() => _MovieChipsState();
}

class _MovieChipsState extends State<MovieChipContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: ((context, index) => Container(
              margin: const EdgeInsets.only(right: 12),
              child: ChoiceChip(
                selectedColor: Colors.purple,
                selected: isSelected,
                onSelected: (bool value) {
                  setState(() {
                    value = isSelected;
                  });
                },
                label: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'All',
                    style: constants.TextStyles.text2,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
