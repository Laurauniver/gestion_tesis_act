 import 'package:drift/drift.dart';
 import 'package:gestion_tesis/src/data/datasources/db/database.dart';

 abstract class UserDataSource {
  Future<List<UserTableEntity>> getAllUser();

  Future<UserTableEntity> getUserById(int id);

  Future<UserTableEntity> getUserByUsername(String username);

  
  //  Future<UserTableEntity> login (String username, String password);

  //  Future<UserTableEntity> logout();

 }

 class UserRepositoryImpl extends UserDataSource {
     UserRepositoryImpl (this._appDatabase);

   final AppDatabase _appDatabase;
   $UserEntityTable get userEntity => _appDatabase.userEntity;
   
     @override
     Future<List<UserTableEntity>> getAllUser() async{
      return await userEntity.select().get();
    
     }
   
     @override
     Future<UserTableEntity> getUserById(int id) async{
      return await (_appDatabase.select(userEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
    
     }
   
     @override
     Future<UserTableEntity> getUserByUsername(String username) async{
      return await (_appDatabase.select(userEntity)
          ..where((tbl) => tbl.username.equals(username)))
        .getSingle();
    
     }

   
     // Lógica para buscar al usuario en la base de datos y validar las credenciales
  //   @override
  //     Future<UserTableEntity> login(String username, String password) async {
  //    final db = await userEntity.instance.database;
  //    final result = await db.query(
  //      'usuario',
  //      where: 'username = ? AND password = ?',
  //      whereArgs: [username, password],
  //    );

  //    if (result.isNotEmpty) {
  //      // Si se encuentra el usuario, devuelve un objeto User
  //      return userEntity.fromMap(result.first);
  //    }

  //    return null;  //Si no se encuentra el usuario, devuelve null
  //  }

  //  @override
  //  Future<void> logout() async {
    
  //  }
 }