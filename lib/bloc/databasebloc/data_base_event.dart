import 'package:equatable/equatable.dart';
import 'package:mob_squad_app/model/user.dart';

abstract class DataBaseEvent extends Equatable {
  const DataBaseEvent();
}


class SaveUserDB extends DataBaseEvent{
  final User user;

  SaveUserDB({this.user});
  @override
  // TODO: implement props
  List<Object> get props => [user];


}
