

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mob_squad_app/model/user.dart';

class DbApiClient {
  final Firestore _firestore = Firestore.instance;

  Future<bool> saveUser(User user) async {
    debugPrint("apiye geliyo");
    DocumentSnapshot gelenUser =
        await Firestore.instance.document("users/${user.userID}").get();
    debugPrint(gelenUser.toString());

      await _firestore
          .collection("users")
          .document(user.userID)
          .setData(user.toMap());
      debugPrint(gelenUser.toString());
      return true;

  }





}
