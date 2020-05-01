import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_squad_app/bloc/authbloc/auth_bloc.dart';
import 'package:mob_squad_app/locator.dart';
import 'package:mob_squad_app/pages/splashScreen.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: BlocProvider(
          create: (context)=> AuthBloc(),
          child: SplashScreen()),
    );
  }
}
