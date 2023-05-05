import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usama_movies/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:usama_movies/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import '../../../core/utils/enumes.dart';
import '/movies/data/data_source/movie_remote_data_source.dart';
import '/movies/data/repository/movies_repository.dart';
import '/movies/domain/repository/base_movies_repo.dart';
import '/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import '/movies/presintation/controller/movies_event.dart';
import '/movies/presintation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      result.fold(
          (l) => emit(state.copyWith(
                nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message,
              )),
          (r) => emit(state.copyWith(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.execute();
      result.fold(
          (l) => emit(state.copyWith(
                popularState: RequestState.error,
                popularMessage: l.message,
              )),
          (r) => emit(state.copyWith(
              popularMovies: r, popularState: RequestState.loaded)));
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase.execute();
      result.fold(
          (l) => emit(state.copyWith(
                topRatedState: RequestState.error,
                topRatedMessage: l.message,
              )),
          (r) => emit(state.copyWith(
              topRatedMovies: r, topRatedState: RequestState.loaded)));
    });
  }
}
