import 'package:appmovil/Buyers/view/screens/authentication_screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(
        //useMaterial3: true,
        //brightness: Brightness.dark,
      //),
      title: 'Material App',
      home: LoginScreen(),
    );
  }
}
