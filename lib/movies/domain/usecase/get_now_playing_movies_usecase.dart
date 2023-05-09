import 'package:dartz/dartz.dart';
import '/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entity/movie.dart';
import '../repository/base_movies_repo.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<Movie>, NoParameters> {
  //call baseMovie repo
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
