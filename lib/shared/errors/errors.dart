abstract class Failure implements Exception {}

class RepositoryFailure extends Failure {}

class DatasourceError extends Failure {}
