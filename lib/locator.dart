import 'package:get_it/get_it.dart';
import 'package:mob_squad_app/data/authApiClient.dart';
import 'package:mob_squad_app/data/authRepository.dart';
import 'package:mob_squad_app/data/dbApiClient.dart';
import 'package:mob_squad_app/data/dbRepository.dart';


GetIt getIt= GetIt.instance;


void setupLocator(){
  getIt.registerLazySingleton<AuthRepository>(() =>AuthRepository());
  getIt.registerLazySingleton<AuthApiClient>(() =>AuthApiClient());
  getIt.registerLazySingleton<DbApiClient>(() =>DbApiClient());
  getIt.registerLazySingleton<DbRepository>(() =>DbRepository());
}