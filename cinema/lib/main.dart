import 'package:cinema/providers/auth.dart';
import 'package:cinema/providers/movie.dart';
import 'package:cinema/screens/auth_screen.dart';
import 'package:cinema/screens/favorite_movies.dart';
import './screens/movie_detail_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Movie(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Movies(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, authData, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cinema',
          theme: ThemeData(brightness: Brightness.dark),
          home: authData.isAuth ? const HomeScreen() : AuthScreen(),
          routes: {
            AuthScreen.routeName: (context) => AuthScreen(),
            HomeScreen.routName: (context) => const HomeScreen(),
            MovieDetailScreen.routeName: (context) => const MovieDetailScreen(),
            FavoriteMovies.routName: (context) => const FavoriteMovies(),
          },
        ),
      ),
    );
  }
}
