import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/navigator/LoginNavigator.dart';
import 'package:starwars/pages/LoginPage.dart';
import 'package:starwars/pages/MainPage.dart';
import 'package:starwars/utils/SimpleBlocObserver.dart';
import 'package:starwars/utils/injector.dart';

import 'constant/Constants.dart';
import 'model/sqliteModel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await baseDio();
  final bool isInitialized = await StarwarsDBModel().initializeDB();
  Bloc.observer = SimpleBlocObserver();
  if (isInitialized) {
    runApp(MyApp());
  } else {
    debugPrint("fail to init db");
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      home: LoginNavigator(),
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => MainPage(),
      },
      theme: ThemeData(
        appBarTheme:
        AppBarTheme(color: Color(Constants.appMainColor), elevation: 0),
        primaryColor: Color(Constants.appMainColor),
        primaryColorDark: Color(Constants.appMainColor),
        accentColor: Color(0xFFe0e0e0),
        backgroundColor: Constants.appBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}