import 'package:botx/util/router.dart';
import 'package:botx/util/scalar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          return OrientationBuilder(
              builder: (context, orientation){
                SizeConfig().initScaler(constraints, orientation);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'BotX',
                  initialRoute: '/',
                  onGenerateRoute: RouteGenerator.generateRoute,
                );
              }
          );
        }
    );
  }
}

