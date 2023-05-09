import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/usecase/base_usecase.dart';
import '/movies/domain/usecase/get_popular_movies_usecase.dart';
import '/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import '../../../core/utils/enumes.dart';
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
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovie);
    on<GetPopularMoviesEvent>(_getPopularMovieEvent);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovie);
  }

  FutureOr<void> _getPopularMovieEvent(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovie(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedState: RequestState.loaded)));
  }

  FutureOr<void> _getNowPlayingMovie(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
  }
}
