import 'package:usama_movies/core/network/error_message_model.dart';

//network
class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

//locale
class LocalException implements Exception {
  final ErrorMessageModel errorMessageModel;

  LocalException({required this.errorMessageModel});
}
