abstract class IUserProvider {
  Future<void> setUser(String json);

  Future<String?> getUser();
}
