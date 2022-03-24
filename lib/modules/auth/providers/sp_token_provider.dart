import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_token_provider.dart';

class SpTokenProvider extends ITokenProvider {
  final String key = 'token_key';

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, token);
  }
}
