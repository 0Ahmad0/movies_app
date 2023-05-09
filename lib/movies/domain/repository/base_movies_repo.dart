import 'package:dartz/dartz.dart';
import 'package:usama_movies/movies/domain/usecase/get_movie_details_usecase.dart';
import '../entity/movie_detail.dart';
import '/movies/domain/entity/movie.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);
}
