import 'package:cinema/providers/movie.dart';
import 'package:cinema/providers/movie_chip.dart';
import './screens/movie_detail_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
      create: (ctx) => Movies()),
      ChangeNotifierProvider(
      create: (ctx) => MoviesChips(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cinema',
        theme: ThemeData.dark(),
        home: const HomeScreen(),
        routes: {
          MovieDetailScreen.routeName: (context) => const MovieDetailScreen(),
        },
      ),
    );
  }
}
