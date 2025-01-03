class Character {
  late String name;
  late String surname;
  late int age;
  late String story;
  late String statistics;
  late String race;

  Character(this.name, this.surname, this.age, this.story, this.statistics, this.race );

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      json['name'],
      json['surname'],
      json['age'],
      json['story'],
      json['statistics'],
      json['race'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'age': age,
      'story': story,
      'statistics': statistics,
      'race': race,
    };
  }
}
