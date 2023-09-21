import 'package:app_mania/screens/cart.dart';
import 'package:app_mania/screens/details.dart';
import 'package:app_mania/screens/fav.dart';
import 'package:app_mania/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const appmania(),
        'details': (context) => const Details(),
        'cart': (context) => const cartPage(),
        'fav': (context) => const favourite(),
      },
    ),
  );
}
