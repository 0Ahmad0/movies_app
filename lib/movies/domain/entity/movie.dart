class Movie {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
  });
// doublecated values from api
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          backdropPath == other.backdropPath &&
          overview == other.overview &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount &&
          genreIds == other.genreIds;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      backdropPath.hashCode ^
      overview.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode ^
      genreIds.hashCode;
}
