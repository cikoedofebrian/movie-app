import 'package:flutter/material.dart';
import 'package:movieapp/providers/movies.dart';
import 'package:movieapp/widgets/picture.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<Movies>(context, listen: false).fetchMovieData(),
          builder: (context, snapshot) => ListView.builder(
                itemBuilder: ((context, index) => Container(
                      child: Text('empty'),
                    )),
                itemCount:
                    Provider.of<Movies>(context, listen: false).list.length,
              )),
    );
  }
}
