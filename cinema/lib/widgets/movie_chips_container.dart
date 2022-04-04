import 'package:flutter/material.dart';
import '../constants.dart' as constants;

class MovieChipContainer extends StatefulWidget {
  const MovieChipContainer({Key? key}) : super(key: key);

  @override
  State<MovieChipContainer> createState() => _MyThreeOptionsState();
}

class _MyThreeOptionsState extends State<MovieChipContainer> {
  int? _value = 0;

  Text _chipText(int index) {
    if (index == 0) {
      return Text(
        'All',
        style: constants.TextStyles.text2,
      );
    }
    if (index == 1) {
      return Text(
        'Action',
        style: constants.TextStyles.text2,
      );
    }
    if (index == 2) {
      return Text(
        'Adventure',
        style: constants.TextStyles.text2,
      );
    } else {
      return Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 9),
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: ((context, index) => Container(
              margin: const EdgeInsets.only(right: 12),
              child: ChoiceChip(
                selectedColor: Colors.purple,
                label: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: _chipText(index)),
                selected: _value == index,
                onSelected: (bool selected) {
                  setState(() {
                    _value = selected ? index : null;
                  });
                },
              ),
            )),
      ),
    );
  }
}
