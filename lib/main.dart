import 'package:flutter/material.dart';
import 'package:flutter_app/pages/HomeStack.dart';
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:flutter_app/pages/NewsStack.dart';
import 'package:flutter_app/pages/ProductStack.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const HomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/homestack',
      routes: {
        //'/': (context) => LoginPage(),
        '/homestack': (context) => HomeStack(),
        '/productstack': (context) => ProductStack(),
        '/newsstack': (context) => NewsStack(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}


