import 'package:get_it/get_it.dart';
import 'package:usama_movies/movies/data/data_source/movie_remote_data_source.dart';
import 'package:usama_movies/movies/data/repository/movies_repository.dart';
import 'package:usama_movies/movies/domain/repository/base_movies_repo.dart';
import 'package:usama_movies/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:usama_movies/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:usama_movies/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:usama_movies/movies/presintation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //MovieBloc
    sl.registerLazySingleton(() => MoviesBloc(sl(), sl(), sl()));

    //UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    //Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    //DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
