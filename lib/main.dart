import 'package:flutter/material.dart';
import 'package:movieapp/providers/auth.dart';
import 'package:movieapp/providers/movies.dart';
import 'package:movieapp/screens/auth.dart';
import 'package:movieapp/screens/home.dart';
import 'package:movieapp/screens/search.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => Authentication())),
        ChangeNotifierProvider(create: (((context) => Movies())))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Authentication>(
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          primarySwatch: Colors.blue,
        ),
        home: value.isAuth ? Home() : Auth(),
        routes: {
          '/home': (context) => const Home(),
          '/search': (context) => const Search()
        },
      ),
    );
  }
}
