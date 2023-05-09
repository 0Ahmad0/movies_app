import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '/movies/domain/repository/base_movies_repo.dart';
import '/core/error/failure.dart';
import '/core/usecase/base_usecase.dart';
import '/movies/domain/entity/movie_detail.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
