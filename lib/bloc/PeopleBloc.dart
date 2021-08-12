import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/event/PeopleEvent.dart';
import 'package:starwars/model/response/BaseResponse.dart';
import 'package:starwars/model/response/PeopleResponse.dart';
import 'package:starwars/model/sqliteModel.dart';
import 'package:starwars/repository/PeopleRepository.dart';
import 'package:starwars/state/PeopleState.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  late final PeopleRepository repository;

  PeopleBloc({required this.repository}) : super(PeopleEmpty());

  PeopleState get initialState => PeopleEmpty();

  @override
  Stream<PeopleState> mapEventToState(PeopleEvent event) async* {
    if (event is GetPeopleData) {
      yield PeopleLoading();
      try {
        final BaseResponse<PeopleResponse> peopleResponse =
            await repository.getPeopleData();
        List<People> peopleList = [];
        for (PeopleResponse p in peopleResponse.results) {
          await People()
              .select()
              .name
              .equals(p.name)
              .toSingle()
              .then((People? data) async {
            if (data == null) {
              People newPeople = new People();
              newPeople.name = p.name;
              newPeople.height = p.height;
              newPeople.mass = p.mass;
              newPeople.hairColor = p.hairColor;
              newPeople.skinColor = p.skinColor;
              newPeople.eyeColor = p.eyeColor;
              newPeople.birthYear = p.birthYear;
              newPeople.gender = p.gender;
              newPeople.created = p.created;
              newPeople.edited = p.edited;
              await newPeople.save();
              peopleList.add(newPeople);
            } else {
              data.height = p.height;
              data.mass = p.mass;
              data.hairColor = p.hairColor;
              data.skinColor = p.skinColor;
              data.eyeColor = p.eyeColor;
              data.birthYear = p.birthYear;
              data.gender = p.gender;
              data.created = p.created;
              data.edited = p.edited;
              await data.save();
              peopleList.add(data);
            }
          });
        }
        yield PeopleLoaded(people: peopleList);
      } catch (ex, err) {
        print("exception " + ex.toString() + err.toString());
        yield PeopleError();
      }
    }
  }
}
