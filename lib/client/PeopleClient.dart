import 'package:dio/dio.dart';
import 'package:starwars/constant/UrlConstants.dart';
import 'package:starwars/model/response/BaseResponse.dart';
import 'package:starwars/model/response/PeopleResponse.dart';
import 'package:starwars/model/sqliteModel.dart';
import 'package:starwars/utils/injector.dart';

class PeopleClient {
  final Dio dio = locator<Dio>();

  Future<BaseResponse<PeopleResponse>> getPeopleData() async {
    try {
      dio.options.contentType = "application/json";
      Response response = await dio.get(UrlConstants.PEOPLE_URL);

      return BaseResponse<PeopleResponse>.fromJson(
          response.data, PeopleResponse.fromJson);
    } catch (stacktrace) {
      throw Exception("Exception occured stackTrace: $stacktrace");
    }
  }
}
