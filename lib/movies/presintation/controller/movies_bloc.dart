import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enumes.dart';
import '/movies/data/data_source/movie_remote_data_source.dart';
import '/movies/data/repository/movies_repository.dart';
import '/movies/domain/repository/base_movies_repo.dart';
import '/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import '/movies/presintation/controller/movies_event.dart';
import '/movies/presintation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      emit(const MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
          (l) => emit(MoviesState(
                nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message,
              )),
          (r) => emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
    });
  }
}
