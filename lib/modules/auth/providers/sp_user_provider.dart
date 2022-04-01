import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_user_provider.dart';

class SpUserProvider extends IUserProvider {
  final String key = 'User_key';

  @override
  Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> setUser(String json) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json);
  }
}
