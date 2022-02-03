import 'package:flutter/material.dart';
import 'package:responsive_app/controllers/menu_controller.dart';
import 'package:responsive_app/responsive.dart';
import 'package:responsive_app/screens/dashboard/dashboard_screen.dart';
import 'components/side_menu.dart';
import 'package:provider/provider.dart';


// ignore: use_key_in_widget_constructors
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // This side meno only for Large Screen
            if (Responsive.isDesktop(context))
              const Expanded(
              // Default flex: 1
              // and it take 1/6 part of screen
                child: SideMenu()
              ),
            const Expanded(
              // it taake 5/6 part of screen
              flex: 5,
              child: DashboardScreen()
            )
          ],
        ),
      ),
    );
  }
}

