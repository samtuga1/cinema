import 'package:cinema/screens/favorite_movies.dart';
import 'package:cinema/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart' as constants;

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: const EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            MenuScreenItem(
              name: 'Home',
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
              },
              icon: const Icon(Icons.home),
            ),
            MenuScreenItem(
              name: 'Favorites',
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(FavoriteMovies.routName);
              },
              icon: const Icon(Icons.favorite),
            ),
            MenuScreenItem(
              name: 'Help',
              onPressed: () {},
              icon: const Icon(Icons.help),
            ),
            MenuScreenItem(
              name: 'Logout',
              onPressed: () {},
              icon: const Icon(Icons.logout),
            )
          ],
        ),
      ),
    );
  }
}

class MenuScreenItem extends StatelessWidget {
  final String name;
  final Function() onPressed;
  final Icon icon;
  const MenuScreenItem({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: ListTile(
            leading: icon,
            title: Text(
              name,
              style: constants.TextStyles.text2,
            ),
          ),
        ),
        const Divider(
          indent: 40,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
