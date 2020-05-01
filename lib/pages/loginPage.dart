import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:mob_squad_app/bloc/authbloc/auth_bloc.dart';
import 'package:mob_squad_app/bloc/authbloc/auth_event.dart';
import 'package:mob_squad_app/bloc/authbloc/auth_state.dart';
import 'package:mob_squad_app/bloc/databasebloc/bloc.dart';
import 'package:mob_squad_app/pages/homePage.dart';
import 'package:mob_squad_app/pages/signUpPage.dart';
import 'package:mob_squad_app/widgets/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _secondEmailController;
  String butonText = "Giriş Yap";
  String textfieldText = "Şifre";
  String sifreniUnuttun = "Şifrenizi mi unuttunuz ?";
  bool isReset = true;
  double oppacity = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _secondEmailController = TextEditingController(text: "");
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title,
      {bool isPassword = false, double opacity = 1.0}) {
    return Opacity(
      opacity: opacity,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: isPassword ? _passwordController : _emailController,
                obscureText: isPassword,
                cursorColor: Colors.deepOrange,
                keyboardType: isPassword
                    ? TextInputType.text
                    : TextInputType.emailAddress,
                decoration: InputDecoration(
                    suffixIcon: isPassword
                        ? FaIcon(FontAwesomeIcons.key)
                        : FaIcon(FontAwesomeIcons.at),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Color(0xfff3f3f4),
                    filled: true))
          ],
        ),
      ),
    );
  }

  Widget _submitButton(AuthBloc authBloc) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.deepPurpleAccent.shade400,
                  offset: Offset(2, 2),
                  blurRadius: 3,
                  spreadRadius: 0.3)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          butonText,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      onTap: () async {
        if (isReset) {
          authBloc.add(EmailLogin(
              email: _emailController.text,
              password: _passwordController.text));
        } else {
          authBloc.add(ForgetPass(email: _emailController.text));
        }
      },
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.deepPurpleAccent,
                thickness: 1,
              ),
            ),
          ),
          Text(
            'ya da',
            style: TextStyle(color: Colors.deepPurpleAccent),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.deepPurpleAccent,
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton(AuthBloc authBloc) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('G',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: GestureDetector(
              onTap: () {
                authBloc.add(GoogleSign());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Google ile Giriş Yap',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Hesabın yok mu ?',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(providers: [
                            BlocProvider<AuthBloc>(
                              create: (context) => AuthBloc(),
                            ),
                            BlocProvider<DataBaseBloc>(
                              create: (context) => DataBaseBloc(),
                            )
                          ], child: SignUpPage())));
            },
            child: Text(
              'Kaydol',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'MOB',
          style: GoogleFonts.pressStart2p(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'SQUAD',
              style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 25),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email", opacity: 1.0),
        _entryField(textfieldText, isPassword: true, opacity: oppacity),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _authBloc = BlocProvider.of<AuthBloc>(context);
    Widget widget = SizedBox(
      width: 0,
      height: 0,
    );
    return Scaffold(
      body: BlocListener(
        bloc: _authBloc,
        listener: (context, state) {
          if (state is AuthErrorState) {
            widget = SizedBox(
              width: 0,
              height: 0,
            );
            final snackBar = SnackBar(
              content: Text("Kullanıcı adı/şifre hatalı"),
              backgroundColor: Colors.red,
            );
            Scaffold.of(context).showSnackBar(snackBar);
          }
          if (state is AuthLoadingState|| state is ForgetLoadingState) {
            widget = LoadingBouncingGrid.square(
              borderColor: Colors.deepOrangeAccent,
              backgroundColor: Colors.deepOrangeAccent,
            );
          }
          if (state is AuthLoadedState) {
            widget = SizedBox(
              width: 0,
              height: 0,
            );
            if (state.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (context) => DataBaseBloc(),
                          child: HomePage(
                            user: state.user,
                          ))),
                  (Route<dynamic> route) => false);
            }
          }
          if(state is ForgetLoadedState){
            widget = SizedBox(
              width: 0,
              height: 0,
            );
            showDialog(
                context: context,builder: (_) => FlareGiffyDialog(
              onlyOkButton: true,
              flarePath: 'assets/dialog.flr',
              flareAnimation: 'jump',
              title: Text('Şifre Sıfırlama Maili Gönderildi',
                style: TextStyle(
                    fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              description: Text("Şifre sıfırlama linki mail hesabınıza göndirilmiştir.Lütfen postanızı kontrol ediniz",
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              entryAnimation: EntryAnimation.DEFAULT,
              onOkButtonPressed: () {
                Navigator.of(context).pop();
              },
            ) );
          }
          if(state is ForgetErrorState){
            widget = SizedBox(
              width: 0,
              height: 0,
            );
            final snackBar = SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            );
            Scaffold.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder(
          bloc: _authBloc,
          builder: (context, statee) {
            return SingleChildScrollView(
                child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: SizedBox(),
                        ),
                        _title(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        _emailPasswordWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        _submitButton(_authBloc),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isReset) {
                                  textfieldText = "Tekrar Emailiniz Giriniz";
                                  butonText = "Şifreyi Sıfırla";
                                  sifreniUnuttun = "Vazgeç";
                                  oppacity = 0.0;
                                  isReset = false;
                                } else {
                                  textfieldText = "Şifre";
                                  butonText = "Giriş Yap";
                                  sifreniUnuttun = "Şifrenizi mi unuttunuz?";
                                  oppacity = 1.0;
                                  isReset = true;
                                }
                              });
                            },
                            child: Container(
                              child: Text(sifreniUnuttun,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.deepPurpleAccent,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                        _divider(),
                        _facebookButton(_authBloc),
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  Center(child: widget),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _createAccountLabel(),
                  ),
                  Positioned(top: 40, left: 0, child: _backButton()),
                  Positioned(
                      top: -MediaQuery.of(context).size.height * .23,
                      right: -MediaQuery.of(context).size.width * .4,
                      child: BezierContainer(
                        kayitMi: false,
                      ))
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
