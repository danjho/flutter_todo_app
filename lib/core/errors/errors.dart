abstract class Failure implements Exception {
  Failure({this.message});
  final String? message;
}

class RepositoryError extends Failure {
  RepositoryError({String? message}) : super(message: message);
}

class DatasourceError extends Failure {
  DatasourceError({String? message}) : super(message: message);
}
