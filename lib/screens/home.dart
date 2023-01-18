import 'package:flutter/material.dart';
import 'package:movieapp/widgets/movie_card.dart';
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
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      // body: new Container(
      //     child: Row(
      //   children: <Widget>[
      //     Flexible(
      //         child: new Text(
      //       movies.list[4].title,
      //     ))
      //   ],
      // ))
      // body: MovieCard(
      //   title: movies.list[4].title,
      //   imageUrl: movies.list[4].imageUrl,
      //   rating: movies.list[4].rating,
      //   year: movies.list[4].year,
      // )
      body: FutureBuilder(
        future: movies.fetchMovieData(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) => MovieCard(
                          title: movies.list[index].title,
                          imageUrl: movies.list[index].imageUrl,
                          rating: movies.list[index].rating,
                          year: movies.list[index].year,
                        ),
                    itemCount: movies.list.length),
      ),
    );
  }
}
