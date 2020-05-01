import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mob_squad_app/data/dbRepository.dart';
import 'package:mob_squad_app/locator.dart';
import 'package:mob_squad_app/model/user.dart';
import './bloc.dart';

class DataBaseBloc extends Bloc<DataBaseEvent, DataBaseState> {

  DbRepository dbRepository=getIt<DbRepository>();
  @override
  DataBaseState get initialState => InitialDataBaseState();

  @override
  Stream<DataBaseState> mapEventToState(
    DataBaseEvent event,
  ) async* {
    if(event is SaveUserDB){
      yield DataBaseLoadingState();
      try{
        //repodan al

        User gelenUser= event.user;
        bool isOk= await dbRepository.saveUser(gelenUser);
        if(isOk) yield DataBaseLoadedState(isOK: isOk);
        else yield DataBaseErrorState();


      }catch(_){
        debugPrint(_);
        yield DataBaseErrorState();

      }
    }
  }
}
