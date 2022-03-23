import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/modules/login/data/data_sources/i_token_local_data_source.dart';

class TokenSpDataSource extends ITokenLocalDataSource {
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
