class MovieDet {
  MovieDet({
    required this.id,
    required this.title,
    required this.rating,
    required this.genres,
    required this.imageUrl,
    required this.overview,
    required this.year,
    required this.votecount,
  });
  final int id;
  final String title;
  final List<String> genres;
  final String year;
  final double rating;
  final String overview;
  final String imageUrl;
  final int votecount;
}
