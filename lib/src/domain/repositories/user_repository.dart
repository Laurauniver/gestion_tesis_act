abstract class UserRepository {
  Future<bool> login(String username, String password);

  Future<void> logout();
}
