import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:usama_movies/core/utils/enumes.dart';
import 'package:usama_movies/movies/domain/entity/movie_detail.dart';
import 'package:usama_movies/movies/domain/entity/recommendation.dart';
import 'package:usama_movies/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:usama_movies/movies/domain/usecase/get_recommendation_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

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

  Future<FutureOr<void>> _getMovieRecommendation(
      GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));

    result.fold(
        (l) => emit(state.copyWith(
            movieRecommendationState: RequestState.error,
            movieDetailMessage: l.message)),
        (r) => emit(state.copyWith(
            movieRecommendation: r,
            movieRecommendationState: RequestState.loaded)));
  }
}
