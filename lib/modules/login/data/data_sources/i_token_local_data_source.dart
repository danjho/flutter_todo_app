abstract class ITokenLocalDataSource {
  Future<void> setToken(String token);
  Future<String?> getToken();
}
