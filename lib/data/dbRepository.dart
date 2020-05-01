


import 'package:mob_squad_app/data/dbApiClient.dart';
import 'package:mob_squad_app/locator.dart';
import 'package:mob_squad_app/model/user.dart';

class DbRepository{

  DbApiClient _dbApiClient= getIt<DbApiClient>();

  Future<bool> saveUser(User user)async{

    return await _dbApiClient.saveUser(user);
  }



}