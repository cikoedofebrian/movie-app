import 'package:flutter/material.dart';
import 'package:movieapp/widgets/drawer.dart';
import 'package:movieapp/widgets/movie_card.dart';
import 'package:provider/provider.dart';
import '../providers/movies.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<Movies>(context);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          'PemroMovie',
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // Provider.of<Movies>(context, listen: false).signUp();
            },
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/search'),
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
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
                          id: movies.list[index].id,
                        ),
                    itemCount: movies.list.length),
      ),
    );
  }
}
