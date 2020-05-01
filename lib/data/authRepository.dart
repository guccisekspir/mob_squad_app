


import 'package:mob_squad_app/data/authApiClient.dart';
import 'package:mob_squad_app/locator.dart';
import 'package:mob_squad_app/model/user.dart';

class AuthRepository{
  AuthApiClient _authApiClient= getIt<AuthApiClient>();
  Future<User> createWithEmailPass(String email,String password)async{
    User user= await _authApiClient.createWithEmailPass(email, password);

    return user;

  }

  Future<User> loginWithEmailPass(String email,String password)async{
    User user= await _authApiClient.loginWithEmailPass(email, password);

    return user;

  }

  Future<User> googleSign()async{
    User user= await _authApiClient.googleSign();

    return user;

  }




}