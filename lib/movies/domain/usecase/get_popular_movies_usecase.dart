import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entity/movie.dart';
import '../repository/base_movies_repo.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
