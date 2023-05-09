part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState moveDetailsState;
  final String movieDetailMessage;
  final List<Recommendation> movieRecommendation;
  final RequestState movieRecommendationState;
  final String movieRecommendationMessage;

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? moveDetailsState,
    String? movieDetailMessage,
    List<Recommendation>? movieRecommendation,
    RequestState? movieRecommendationState,
    String? movieRecommendationMessage,
  }) {
    return MovieDetailsState(
        movieDetail: movieDetail ?? this.movieDetail,
        moveDetailsState: moveDetailsState ?? this.moveDetailsState,
        movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
        movieRecommendation: movieRecommendation ?? this.movieRecommendation,
        movieRecommendationState:
            movieRecommendationState ?? this.movieRecommendationState,
        movieRecommendationMessage:
            movieRecommendationMessage ?? this.movieRecommendationMessage);
  }

  const MovieDetailsState(
      {this.movieDetail,
      this.moveDetailsState = RequestState.loaded,
      this.movieDetailMessage = '',
      this.movieRecommendation = const [],
      this.movieRecommendationState = RequestState.loaded,
      this.movieRecommendationMessage = ''});

  @override
  List<Object?> get props =>
      [movieDetail, moveDetailsState, movieDetailMessage];
}
