import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PeopleResponse.g.dart';

@JsonSerializable()
class PeopleResponse extends Equatable {
  String? name;
  String? height;
  String? mass;
  @JsonKey(name: "hair_color")
  String? hairColor;
  @JsonKey(name: "skin_color")
  String? skinColor;
  @JsonKey(name: "eye_color")
  String? eyeColor;
  @JsonKey(name: "birth_year")
  String? birthYear;
  String? gender;
  @JsonKey(name: "homeworld")
  String? homeWorld;
  List<String>? films;
  List<String>? species;
  List<String>? vehicles;
  List<String>? starships;
  String? created;
  String? edited;
  String? url;

  PeopleResponse(
      {this.name,
      this.height,
      this.mass,
      this.hairColor,
      this.skinColor,
      this.eyeColor,
      this.birthYear,
      this.homeWorld,
      this.films,
      this.species,
      this.vehicles,
      this.starships,
      this.created,
      this.edited,
      this.url});

  Map<String, dynamic> toJson() => _$PeopleResponseToJson(this);

  static PeopleResponse fromJson(Map<String, dynamic> json) =>
      _$PeopleResponseFromJson(json);

  @override
  List<Object?> get props => [
        name,
        height,
        mass,
        hairColor,
        skinColor,
        eyeColor,
        birthYear,
        homeWorld,
        films,
        species,
        vehicles,
        starships,
        created,
        edited,
        url
      ];
}
