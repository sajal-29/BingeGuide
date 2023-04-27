import 'package:flutter/material.dart';
class BottomDrawer extends StatelessWidget {
  const BottomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
    return BottomDrawer(
      key: _globalKey,
    );
  }
}
