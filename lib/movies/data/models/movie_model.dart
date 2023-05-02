import '../../domain/entity/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.voteCount,
    required super.releaseDate,
    required super.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdropPath'],
        overview: json['overview'],
        voteAverage: json['voteAverage'],
        voteCount: json['voteCount'],
        releaseDate: json['releaseDate'],
        genreIds: List<int>.from(json['genreIds'].map((e) => e)), //list
      );
}
