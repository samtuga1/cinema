import 'package:flutter/material.dart';
import '../constants.dart' as constants;

Padding movieType(String name) {
  return Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 2, left: 5),
    child: Text(
      name,
      style: constants.TextStyles.text1.copyWith(
        color: Colors.amber,
      ),
    ),
  );
}
