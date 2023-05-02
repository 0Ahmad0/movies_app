import 'package:dio/dio.dart';

import '../models/movie_model.dart';

class MovieRemoteDataSource {
  getNowPlayingMovies() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/popular?api_key=8e5a4f3d34a110fec8a731e3ad5537ee');
    if (response.statusCode == 200) {
      return List<MovieModel>.from(response.data);
    }
  }
}
