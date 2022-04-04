import 'package:flutter/foundation.dart';

class MovieChip {
  final String? name;
  int? chipIndex;

  MovieChip({
    this.name,
    this.chipIndex,
  });
}

class MoviesChips with ChangeNotifier {
  final List<MovieChip> _chips = [
    MovieChip(name: 'All', chipIndex: 0),
    MovieChip(name: 'Action', chipIndex: 1),
    MovieChip(name: 'Adventure', chipIndex: 2),
    MovieChip(name: 'Series', chipIndex: 3),
  ];

  List<MovieChip> get chips {
    return _chips;
  }
}
