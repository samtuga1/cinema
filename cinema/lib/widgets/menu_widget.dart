import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => ZoomDrawer.of(context).toggle(),
      );
}
