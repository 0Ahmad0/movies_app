import 'package:get_it/get_it.dart';
import 'package:usama_movies/movies/presintation/controller/movie_details_bloc.dart';
import '/movies/data/data_source/movie_remote_data_source.dart';
import '/movies/data/repository/movies_repository.dart';
import '/movies/domain/repository/base_movies_repo.dart';
import '/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import '/movies/domain/usecase/get_popular_movies_usecase.dart';
import '/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import '/movies/presintation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //MovieBloc
    sl.registerLazySingleton(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerLazySingleton(() => MovieDetailsBloc(sl()));

    //UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

    //Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    //DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
