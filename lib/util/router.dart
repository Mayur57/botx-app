import 'package:botx/screens/MapPage.dart';
import 'package:botx/screens/botVitalsPage.dart';
import 'package:botx/screens/errorPage.dart';
import 'package:botx/screens/historyPage.dart';
import 'package:botx/screens/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => MapPage());
      case '/vitals':
        return MaterialPageRoute(builder: (_) => BotVitalsPage());
      case '/history':
        return MaterialPageRoute(builder: (_) => HistoryPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }

  }
}