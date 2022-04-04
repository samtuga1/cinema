import 'package:flutter/foundation.dart';

class MovieChip {
  final String? name;
  final int? index;

  MovieChip(this.name, this.index);
}

class MoviesChips with ChangeNotifier {
  List<MovieChip> _chips = [];

  List<MovieChip> get chips {
    return _chips;
  }

}
