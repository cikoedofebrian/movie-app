import 'package:flutter/material.dart';
import 'package:movieapp/providers/movies.dart';
import 'package:movieapp/screens/home.dart';
import 'package:provider/provider.dart';
import 'test.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
