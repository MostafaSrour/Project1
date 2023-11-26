import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login and Signup App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.dark(
          primary: Colors.deepOrange, // Use deep orange as the primary color
          secondary: Colors.orangeAccent, // Use orange accent color
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          color: Colors.grey[800],
        ),
        cardColor: Colors.grey[800],
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.orangeAccent),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey[700],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.orangeAccent,
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
