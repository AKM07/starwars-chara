import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starwars/model/sqliteModel.dart';
import 'package:starwars/navigator/FadeRoute.dart';
import 'package:starwars/navigator/LoginNavigator.dart';
import 'package:starwars/utils/PreferencesUtil.dart';
import 'package:starwars/utils/SizeUtil.dart';

import 'MainPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'profile',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );
  GoogleSignInAccount? _currentUser;

  @override
  Widget build(BuildContext context) {
    SizeUtil().init(context);
    double defaultSize = SizeUtil.defaultSize!;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          width: SizeUtil.screenWidth,
          height: SizeUtil.screenHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/starwars-logo.png",
                height: defaultSize * 20,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please Login with your google account and May force be with you",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  doLoginGoogle();
                },
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> doLoginGoogle() async {
    _currentUser = await _googleSignIn.signIn();
    if (_currentUser != null) {
      await util.putString(PreferencesUtil.userId, _currentUser!.id);
      Account account = new Account();
      account.id = _currentUser!.id;
      account.name = _currentUser!.displayName;
      account.email = _currentUser!.email;
      account.photoUrl = _currentUser!.photoUrl;
      await account.save();
      Navigator.of(context).pushAndRemoveUntil(
          FadeRoute(page: MainPage()), (Route<dynamic> route) => false);
    }
  }
}
