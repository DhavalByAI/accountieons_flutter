import 'dart:developer';

import 'package:accountieons_flutter/widgets/cAppBar.dart';
import 'package:accountieons_flutter/widgets/drawer.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/c_bounce.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: true,
      drawer: const CDrawer(),
      body: Column(
        children: [
          cAppBar(
            leading: cBounce(
              onPressed: () {
                log('Drawer Key Pressed');
                scaffoldKey.currentState!.openDrawer();
              },
              child: Image.asset(
                'assets/icons/drawer.png',
                height: 24,
              ),
            ),
            pageName: 'Dashboard',
          )
        ],
      ),
    );
  }
}
