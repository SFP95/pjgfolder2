class Game {

  late int id;
  late String name;

  Game(this.id, this.name);

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      json['id'],
      json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      // Mapear otras propiedades del objeto a JSON
    };
  }
}