import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:usama_movies/core/utils/enumes.dart';
import 'package:usama_movies/movies/domain/entity/movie_detail.dart';
import 'package:usama_movies/movies/domain/usecase/get_movie_details_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  Future<FutureOr<void>> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            moveDetailsState: RequestState.error,
            movieDetailMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetail: r, moveDetailsState: RequestState.loaded)));
  }
}
