import 'package:flutter/material.dart';
import 'package:movieapp/providers/movies.dart';
import 'package:movieapp/screens/auth.dart';
import 'package:movieapp/screens/home.dart';
import 'package:movieapp/screens/search.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Movies(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primarySwatch: Colors.blue,
      ),
      home: const Auth(),
      routes: {
        '/home': (context) => const Home(),
        '/search': (context) => const Search()
      },
    );
  }
}
