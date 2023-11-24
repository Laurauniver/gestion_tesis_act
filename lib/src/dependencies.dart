import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:gestion_tesis/src/data/remote_data_source/no_conf_remote_data_source.dart';
import 'package:gestion_tesis/src/data/remote_data_source/tesis_remote_data_sources.dart';
import 'package:gestion_tesis/src/data/remote_data_source/tests_remote_data_sources.dart';
import 'package:gestion_tesis/src/data/remote_data_source/tribunal_remote_data_source.dart';
import 'package:gestion_tesis/src/data/remote_data_source/tutor_remote_data_source.dart';
import 'package:gestion_tesis/src/data/repositories/no_conf_repository_impl.dart';
import 'package:gestion_tesis/src/data/repositories/tesis_repositrory_impl.dart';
import 'package:gestion_tesis/src/data/repositories/test_repository_impl.dart';
import 'package:gestion_tesis/src/data/repositories/tribual_repository_impl.dart';
import 'package:gestion_tesis/src/data/repositories/tutor_repository_impl.dart';
import 'package:gestion_tesis/src/data/repositories/auth_repository_imp.dart';
import 'package:gestion_tesis/src/domain/repositories/auth_repository.dart';
import 'package:gestion_tesis/src/domain/repositories/no_conf_repository.dart';
import 'package:gestion_tesis/src/domain/repositories/tesis_repository.dart';
import 'package:gestion_tesis/src/domain/repositories/tests_repository.dart';
import 'package:gestion_tesis/src/domain/repositories/tribunal_repository.dart';
import 'package:gestion_tesis/src/domain/repositories/tutor_repository.dart';
import 'package:gestion_tesis/src/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await registerStorageDirectory();

  //SharedPreferences

  final SharedPreferences preferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => preferences);

  //Data sources
  injector
    ..registerFactory(
      () => TesisRemoteDataSource(),
    )
    ..registerLazySingleton(
      () => NoConformidadRemoteDataSource(),
    )
    ..registerFactory(
      () => TestsRemoteDataSource(),
    )
    ..registerFactory(
      () => TribunalRemoteDataSource(),
    )
    ..registerFactory(
      () => TutorRemoteDataSource(),
    );

  //Repositories
  injector
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(injector()),
    )
    ..registerLazySingleton<TesisRepository>(
      () => TesisRepositoryImpl(injector()),
    )
    ..registerLazySingleton<TribunalRepository>(
      () => TribunalRepositoryImpl(injector()),
    )
    ..registerLazySingleton<TestsRepository>(
      () => TestsRepositoryImpl(injector()),
    )
    ..registerLazySingleton<TutorRepository>(
      () => TutorRepositoryImpl(injector()),
    )
    ..registerLazySingleton<NoConformidadRepository>(
      () => NoConformidadRepositoryImpl(injector()),
    );

  // Blocs
  injector.registerFactory(
    () => AuthBloc(injector()),
  );
}

Future<void> registerStorageDirectory() async {
  if (kIsWeb) {
    final webStorageDirectory = Directory('');
    injector.registerLazySingleton(() => webStorageDirectory);
  } else if (Platform.isAndroid) {
    final Directory? dir = await getExternalStorageDirectory();
    if (dir != null) {
      injector.registerLazySingleton(() => dir);
    }
  } else if (Platform.isIOS) {
    final Directory dir = await getApplicationDocumentsDirectory();
    injector.registerLazySingleton(() => dir);
  }
}
