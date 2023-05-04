import 'package:equatable/equatable.dart';
import 'package:usama_movies/core/utils/enumes.dart';

import '../../domain/entity/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String message;

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        message,
      ];

  MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.message = '',
  });
}
