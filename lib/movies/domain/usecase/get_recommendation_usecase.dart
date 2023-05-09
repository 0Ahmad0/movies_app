import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:usama_movies/core/error/failure.dart';
import 'package:usama_movies/movies/domain/entity/recommendation.dart';
import 'package:usama_movies/movies/domain/repository/base_movies_repo.dart';

import '../../../core/usecase/base_usecase.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendationMovies(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}
