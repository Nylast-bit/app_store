import 'dart:io';

import 'package:appmovil/Buyers/view/screens/authentication_screens/login_screen.dart';
import 'package:appmovil/Buyers/view/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
  ? await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCeRtE0Szqgp9DeKRU0NHCSujTSbBOHZZc",
        appId: "1:1000882735105:android:9583ef5c1dc9ee63bc5800",
        messagingSenderId: "1000882735105",
        projectId:  "app-store-6940c",
        storageBucket: "gs://app-store-6940c.appspot.com"
    )
  )
  : await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(
        //useMaterial3: true,
        //brightness: Brightness.dark,
      //),
      title: 'Material App',
      home: MainScreen(),//LoginScreen(),
    );
  }
}
