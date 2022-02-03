import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_app/controllers/menu_controller.dart';
import 'package:responsive_app/screens/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController()
          )
        ],
        child: MainScreen()
      ),
    );
  }
}