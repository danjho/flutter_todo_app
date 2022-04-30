/// Classe destinada ao agrupamento dos endpoints da API
class EndPoint {
  EndPoint._();

  static const String signIn = '/auth/login';
  static const String signUp = '/auth/sign-up';
  static const String tasks = '/me/tasks';
  static const String categories = '/me/categories';
}
