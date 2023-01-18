import 'package:flutter/material.dart';
import 'package:movieapp/widgets/genres.dart';
import 'package:provider/provider.dart';
import 'package:movieapp/providers/movies.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.title, required this.id});
  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(snapshot.data!.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        color: Colors.black,
                        child: Text(
                          "${snapshot.data!.title} (${snapshot.data!.year})",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sinopsis',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.overview),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Genres',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Genres(name: snapshot.data!.genres),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Rating',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          size: 40,
                                          Icons.star_rounded,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "${snapshot.data!.rating.toString()}/10",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "from ${snapshot.data!.votecount.toString()} votes",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    )
                                  ],
                                )
                              ]))
                    ],
                  ),
                ],
              ),
            );
          }),
          future: Provider.of<Movies>(context).getMovieDetails(id),
        ));
  }
}
