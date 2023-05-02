import 'package:usama_movies/movies/domain/entity/movie.dart';

abstract class BaseMoviesRepository {
  Future<List<Movie>> getNowPlaying();

  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTopRatedMovies();
}
