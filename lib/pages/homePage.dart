import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_squad_app/bloc/authbloc/auth_bloc.dart';
import 'package:mob_squad_app/bloc/databasebloc/bloc.dart';
import 'package:mob_squad_app/model/user.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(user);
}

class _HomePageState extends State<HomePage> {
  final User _user;

  _HomePageState(this._user);

  @override
  Widget build(BuildContext context) {
    DataBaseBloc _databaseBloc = BlocProvider.of<DataBaseBloc>(context);

    return Scaffold(
        body: Center(
      child: RaisedButton(
        child: Text("${_user.userID}ı kaydet"),
        onPressed: (){
          _databaseBloc.add(SaveUserDB(user: _user));
        },
      ),
    ));
  }
}
