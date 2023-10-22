 import 'package:gestion_tesis/src/data/datasources/db/database.dart';


 abstract class UserRepository {

  Future<UserTableEntity> getUserById(int id);

  Future<List<UserTableEntity>> getAllUser();

  Future<UserTableEntity> getUserByUsername(String username);

  //  Future<UserTableEntity> login(String username, String password);

  //  Future<void> logout();
   }
