class CharacterResponse_dto{

  late String name;
  late String surname;
  late int age;
  late String story;
  late String statistics;
  late int race;

  CharacterResponse_dto(this.name,this.surname,this.age,this.story,this.race, json);

  factory CharacterResponse_dto.fromJson(Map<String, dynamic> json){
    return CharacterResponse_dto(
        json['name'],
        json['surname'],
        json['age'],
        json['story'],
        json['statistics'],
        json['race']
    );
  }
}