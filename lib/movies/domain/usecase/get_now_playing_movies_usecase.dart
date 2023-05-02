import '../entity/movie.dart';
import '../repository/base_movies_repo.dart';

class GetNowPlayingMoviesUseCase {
  //call baseMovie repo
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getNowPlaying();
  }
}
