import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usama_movies/movies/domain/entity/movie.dart';

void main() {
  Movie movie1 = Movie(
      id: 1,
      title: "title",
      backdropPath: "backdropPath",
      overview: "overview",
      voteAverage: 15,
      voteCount: 325,
      genreIds: [1, 3, 4, 5],
      releaseDate: DateTime.now());
  Movie movie2 = Movie(
      id: 1,
      title: "title",
      backdropPath: "backdropPath",
      overview: "overview",
      voteAverage: 15,
      voteCount: 325,
      releaseDate: DateTime.now(),
      genreIds: [1, 3, 4, 5]);
  print(movie1 == movie2);
  runApp(const MaterialApp());
}
