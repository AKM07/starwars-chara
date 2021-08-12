import 'package:equatable/equatable.dart';

abstract class PeopleEvent extends Equatable {
  const PeopleEvent();
}

class GetPeopleData extends PeopleEvent {
  const GetPeopleData();

  @override
  List<Object> get props => [];
}

class InsertPeopleData extends PeopleEvent {
  const InsertPeopleData();

  @override
  List<Object> get props => [];
}
