import 'package:dartz/dartz.dart';
import '/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entity/movie.dart';
import '../repository/base_movies_repo.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
