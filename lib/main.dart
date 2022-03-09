import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'view/View_one.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.yellow,
        ),
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
            backgroundColor: Colors.white),

      ),
      home: ViewOne(),
    );
  }
}
