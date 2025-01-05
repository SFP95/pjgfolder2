import 'dart:core';

class CharacterRequest_dto{

  late String name;
  late String surname;
  late int age;
  late String story;
  late String statistics;
  late String race;

  CharacterRequest_dto({
    required this.name,
    required this.surname,
    required this.age,
    required this.story,
    required this.race,
  });

  CharacterRequest_dto.fromJson(Map<String, dynamic> json)
    :   name = json['name'],
        surname = json['surname'],
        age = json ['age'],
        story = json['story'],
        statistics = json['statistics'],
        race = json['race']
  ;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'age':age,
      'story':story,
      'statistics':statistics,
      'race':race
    };
  }
}


