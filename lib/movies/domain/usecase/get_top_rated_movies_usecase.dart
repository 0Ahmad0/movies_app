import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entity/movie.dart';
import '../repository/base_movies_repo.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
