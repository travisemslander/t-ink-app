import 'package:flutter/material.dart';
import 'routing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).copyWith(
      primaryColor: Colors.teal,
    );

    return MaterialApp(
      initialRoute: '/login',
      theme: themeData,
      routes: routes
    );
  }
}


