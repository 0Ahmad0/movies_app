part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState moveDetailsState;
  final String movieDetailMessage;

  MovieDetailsState copyWith(
      {MovieDetail? movieDetail,
      RequestState? moveDetailsState,
      String? movieDetailMessage}) {
    return MovieDetailsState(
        movieDetail: movieDetail ?? this.movieDetail,
        moveDetailsState: moveDetailsState ?? this.moveDetailsState,
        movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage);
  }

  const MovieDetailsState({
    this.movieDetail,
    this.moveDetailsState = RequestState.loaded,
    this.movieDetailMessage = '',
  });

  @override
  List<Object?> get props =>
      [movieDetail, moveDetailsState, movieDetailMessage];
}
