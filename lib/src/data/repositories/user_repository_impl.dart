import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/user_datasource.dart';
import 'package:gestion_tesis/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this._userDataSource);
  final UserDataSource _userDataSource;
  
  @override
  Future<List<UserTableEntity>> getAllUser() async{
    return await _userDataSource.getAllUser();
    
  }
  
  @override
  Future<UserTableEntity> getUserById(int id) async{
    return await _userDataSource.getUserById(id);
    
  }
  
  @override
  Future<UserTableEntity> getUserByUsername(String username) async{
    return await _userDataSource.getUserByUsername(username);
    
  }




  // @override
  // Future<UserTableEntity> login(String username, String password) async {
  //   // Lógica para realizar la autenticación del usuario
  //   return await _userDataSource.login(username, password);
  // }

  // @override
  // Future<void> logout() async {
  //   // Lógica para cerrar sesión del usuario
  //   await _userDataSource.logout();
  // }
}