import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/no_conf_datasource.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tesis_datasources.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tests_datasource.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tribunal_datasources.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tutor_datasource.dart';
import 'package:gestion_tesis/src/data/repositories/tesis_repositrory_impl.dart';
import 'package:gestion_tesis/src/data/repositories/test_repository_impl.dart';
import 'package:gestion_tesis/src/data/repositories/tribual_repository_impl.dart';
import 'package:gestion_tesis/src/data/repositories/tutor_repository_impl.dart';
import 'package:gestion_tesis/src/domain/repositories/auth_repository_imp.dart';
import 'package:gestion_tesis/src/domain/repositories/tesis_repository.dart';
import 'package:gestion_tesis/src/domain/repositories/tests_repository.dart';
import 'package:gestion_tesis/src/domain/repositories/tribunal_repository.dart';
import 'package:gestion_tesis/src/domain/repositories/tutor_repository.dart';
import 'package:gestion_tesis/src/presentation/global_search/cubit/global_search_cubit.dart';
import 'package:gestion_tesis/src/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:gestion_tesis/src/presentation/pages/no_conf/cubit/no_conf_cubit.dart';
import 'package:gestion_tesis/src/presentation/pages/tesis/cubit/tesis_cubit.dart';
import 'package:gestion_tesis/src/presentation/pages/tests/cubit/tests_cubit.dart';
import 'package:gestion_tesis/src/presentation/pages/tribunal/cubit/tribunal_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await registerStorageDirectory();

  //SharedPreferences

  final SharedPreferences preferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => preferences);

  //Database
  injector.registerLazySingleton<AppDatabase>(() => AppDatabase());

  //Repositories
  injector
    ..registerFactory(
      () => TesisDataSource(injector()),
    )
    ..registerFactory(
      () => TribunalDataSource(injector()),
    )
    ..registerFactory(
      () => TutorDataSource(injector()),
    )
    ..registerFactory(
      () => TestsDataSource(injector()),
    )
    ..registerFactory(
      () => NoConformidadDataSource(injector()),
    );

  //Repositories
  injector
    ..registerLazySingleton(
      () => AuthRepository(injector()),
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
    );

  // Blocs
  injector
    ..registerFactory(
      () => GlobalSearchCubit(injector()),
    )
    ..registerFactory(
      () => TesisCubit(injector()),
    )
    ..registerFactory(
      () => TribunalCubit(injector()),
    )
    ..registerFactory(
      () => TestsCubit(injector()),
    )
    ..registerFactory(
      () => NoConformidadCubit(injector()),
    )
    ..registerFactory(
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
