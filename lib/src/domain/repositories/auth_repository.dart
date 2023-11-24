abstract class AuthRepository {
  bool authentication(String user, String password);

  Future checkLogin();

  Future<void> logout();
}
