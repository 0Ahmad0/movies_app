import 'package:dio/dio.dart';
import 'package:usama_movies/movies/data/models/movie_detail_model.dart';
import 'package:usama_movies/movies/data/models/recommendation_model.dart';
import 'package:usama_movies/movies/domain/entity/recommendation.dart';
import 'package:usama_movies/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:usama_movies/movies/domain/usecase/get_recommendation_usecase.dart';
import '/core/error/exceptions.dart';
import '/core/network/api_constants.dart';

import '../../../core/network/error_message_model.dart';
import '../models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<Recommendation>> getRecommendationMovies(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<Recommendation>> getRecommendationMovies(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.recommendationMoviesPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
