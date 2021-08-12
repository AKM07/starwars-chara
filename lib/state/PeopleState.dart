import 'package:equatable/equatable.dart';
import 'package:starwars/model/response/BaseResponse.dart';
import 'package:starwars/model/response/PeopleResponse.dart';
import 'package:starwars/model/sqliteModel.dart';

abstract class PeopleState extends Equatable {
  const PeopleState();

  @override
  List<Object> get props => [];
}

class PeopleEmpty extends PeopleState {}

class PeopleLoading extends PeopleState {}

class PeopleLoaded extends PeopleState {
  final List<People> people;

  const PeopleLoaded({required this.people});

  @override
  List<Object> get props => [people];
}

class PeopleError extends PeopleState {}
