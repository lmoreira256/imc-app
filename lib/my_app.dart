import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imc_app/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.redAccent,
        ),
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}
