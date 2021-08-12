import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars/constant/UrlConstants.dart';
import 'package:starwars/interceptors/LoggingInterceptors.dart';

import 'PreferencesUtil.dart';

GetIt locator = GetIt.instance;

Future baseDio() async {
  final options = BaseOptions(
      baseUrl: UrlConstants.BASE_URL,
      connectTimeout: 60000,
      receiveTimeout: 3000);

  var dio = Dio(options);

  dio.interceptors.add(LoggingInterceptors());

  locator.registerSingleton<Dio>(dio);
}

Future setupLocator() async {
  PreferencesUtil util = (await PreferencesUtil.getInstance())!;
  locator.registerSingleton<PreferencesUtil>(util);
}
