class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.rating,
    // required this.genres,
    required this.imageUrl,
    required this.overview,
    required this.year,
    // required this.runtime,
  });
  final int id;
  final String title;
  final String year;
  final double rating;
  // final int runtime;
  // final List<String> genres;
  final String overview;
  final String imageUrl;
}
