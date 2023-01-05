import 'package:flutter/material.dart';
import './app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple, // no effect on AppBar
        // accentColor: Colors.amber,     // deprecated
        colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.amber, primarySwatch: Colors.purple),
        // ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        fontFamily: 'Quicksand',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //       titleLarge: const TextStyle(
        //           fontFamily: 'OpenSans',
        //           fontSize: 18,
        //           fontWeight: FontWeight.bold
        //           ),
        //     ),
        textTheme: const TextTheme(
          headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold),
          button: TextStyle(color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.purple,
            titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
            )
            // textTheme: // deprecated
            ),
      ),
      home: MyHomePage(),
    );
  }
}
