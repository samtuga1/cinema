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
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: const Icon(Icons.favorite),
                    title: Text(
                      'Favorites',
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
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: const Icon(Icons.help),
                    title: Text(
                      'Help',
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
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: const Icon(Icons.logout),
                    title: Text(
                      'Logout',
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
            )
          ],
        ),
      ),
    );
  }
}
