import 'package:flutter/material.dart';
import 'package:flutter_app/pages/AboutPage.dart';
import 'package:flutter_app/pages/CameraPage.dart';
import 'package:flutter_app/pages/ContactPage.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/CompanyPage.dart';
import 'package:flutter_app/pages/MapPage.dart';
import 'package:flutter_app/pages/PicturePage.dart';
import 'package:flutter_app/pages/TeamPage.dart';
import 'package:flutter_app/pages/MapTeam.dart';

class HomeStack extends StatefulWidget {
  const HomeStack({super.key});

  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'homestack/home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'homestack/home':
            builder = (BuildContext context) => const HomePage();
            break;
          case 'homestack/about':
            builder = (BuildContext context) => const AboutPage();
            break;
          case 'homestack/contact':
            builder = (BuildContext context) => const ContactPage();
            break;
          case 'homestack/company':
            builder = (BuildContext context) => const CompanyPage();
            break;
          case 'homestack/camera':
            builder = (BuildContext context) => const CameraPage();
            break;
          case 'homestack/picture':
            builder = (BuildContext context) => const PicturePage();
            break;
          case 'homestack/map':
            builder = (BuildContext context) => const MapPage();
            break;
          case 'homestack/team':
            builder = (BuildContext context) => const TeamPage();
            break;
          case 'homestack/mapteam':
            builder = (BuildContext context) => const MapTeam();
            break;
    
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}
