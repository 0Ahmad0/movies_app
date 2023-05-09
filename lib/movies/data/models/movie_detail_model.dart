import '/movies/data/models/genres__model.dart';

import '/movies/domain/entity/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runTime,
      required super.title,
      required super.voteAverage,
      required super.genres});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runTime: json['run_time'],
        title: json['title'],
        voteAverage: json['vote_average'],
        genres: List<GenresModel>.from(
            json['genres'].map((x) => GenresModel.fromJson(x))),
      );
}
