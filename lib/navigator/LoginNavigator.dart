import 'package:flutter/material.dart';
import 'package:starwars/pages/LoginPage.dart';
import 'package:starwars/pages/MainPage.dart';
import 'package:starwars/utils/PreferencesUtil.dart';
import 'package:starwars/utils/injector.dart';

import 'FadeRoute.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final PreferencesUtil util = locator<PreferencesUtil>();

class LoginRoutes {
  static const String loginRoot = 'LoginPage';
  static const String mainPageNavigator = 'MainPage';
}

class LoginNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: !util.isKeyExists(PreferencesUtil.userId)
            ? LoginRoutes.loginRoot
            : LoginRoutes.mainPageNavigator,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case LoginRoutes.loginRoot:
              return FadeRoute(page: LoginPage());
            default:
              return FadeRoute(page: MainPage());
          }
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
