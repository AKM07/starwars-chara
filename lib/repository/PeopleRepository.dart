import 'package:starwars/client/PeopleClient.dart';
import 'package:starwars/model/response/BaseResponse.dart';
import 'package:starwars/model/response/PeopleResponse.dart';

class PeopleRepository {
  late final PeopleClient peopleClient;

  PeopleRepository({required this.peopleClient});

  Future<BaseResponse<PeopleResponse>> getPeopleData() async {
    return await peopleClient.getPeopleData();
  }
}
