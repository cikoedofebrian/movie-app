import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import 'dart:convert';

class Movies extends ChangeNotifier {
  List<Movie> _list = [];

  List<Movie> get list {
    return _list;
  }

  Future<void> fetchMovieData() async {
    List<Movie> temporaryList = [];
    final url = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=dbcfecebada855447ced97cf5bf08829");
    final data = await http.get(url);
    final List<dynamic> convertedData = json.decode(data.body)['results'];
    for (var element in convertedData) {
      temporaryList.add(Movie(
          id: element['id'],
          title: element['original_title'],
          rating: element['vote_average'].toDouble(),
          imageUrl: "https://image.tmdb.org/t/p/w500/${element['poster_path']}",
          overview: element['overview'],
          year: (element["release_date"].toString().length > 4)
              ? element["release_date"].toString().substring(0, 4)
              : ""));
    }
    _list = temporaryList;
  }
}
