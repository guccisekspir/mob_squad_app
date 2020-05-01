import 'package:equatable/equatable.dart';
import 'package:mob_squad_app/model/user.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class InitialAuthState extends AuthState {
  @override
  List<Object> get props => [];
}


class AuthLoadingState extends AuthState{


  @override
  // TODO: implement props
  List<Object> get props => null;
}
class AuthLoadedState extends AuthState{
  final User user;

  AuthLoadedState({this.user});
  @override
  // TODO: implement props
  List<Object> get props => [user];
}
class AuthErrorState extends AuthState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ForgetLoadingState extends AuthState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ForgetLoadedState extends AuthState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}


class ForgetErrorState extends AuthState{
  final String errorMessage;

  ForgetErrorState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object> get props => null;

}