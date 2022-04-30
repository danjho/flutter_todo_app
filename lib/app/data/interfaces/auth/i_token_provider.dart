abstract class ITokenProvider {
  Future<void> setToken(String token);

  Future<String?> getToken();
}
