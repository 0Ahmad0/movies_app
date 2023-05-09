import 'package:usama_movies/movies/domain/entity/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
          backdropPath:
              json['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
          id: json['id']);
}
