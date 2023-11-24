import 'package:gestion_tesis/src/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  final SharedPreferences preferences;

  AuthRepositoryImpl(this.preferences);

  @override
  Future<bool> checkLogin() async {
    final token = preferences.getString('token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> logout() async {
    await preferences.clear();
  }
  
  @override
  bool authentication(String user, String password) {
    const String defaultUser = "Admin";
    const String defaultPassword = "Admin";

    if (user == defaultUser && password == defaultPassword) {
      const token = '1234567890';
      preferences.setString('token', token);
      return true;
    } else {
      return false;
    }
  }
}
