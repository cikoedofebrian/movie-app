import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movies.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<Movies>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PemroMovie',
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: movies.fetchMovieData(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) => Text(movies.list[index].title),
                itemCount: movies.list.length),
      ),
    );
  }
}
