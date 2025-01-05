import '../character/Character.dart';
import '../game/Campaing.dart';
import '../game/Game.dart';

class User{
  late int id;
  late String alias;
  late int identityId;
  late DateTime? birthDate;
  late String imageUrl;
  late List<Character>? characters;
  late List<Campaing>? campaings;
  late List<Game>? games;

  User(this.id,this.alias,this.identityId,this.birthDate,this.imageUrl/*,this.characters,this.campaings,this.games*/);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        alias = json['alias'],
        identityId = json['identityId'],
        birthDate = DateTime.parse(json['birthDate']),
        imageUrl = json['imageUrl'],
        characters = _parseCharacters(json['characters']),
        campaings = _parseCampaings(json['campaings']),
        games = _parseGames(json['games']);


  // Métodos privados para procesar las listas
  static List<Character>? _parseCharacters(dynamic json) {
    if (json != null && json is List<dynamic>) {
      return json.map((data) => Character.fromJson(data)).toList();
    }
    return null;
  }

  static List<Campaing>? _parseCampaings(dynamic json) {
    if (json != null && json is List<dynamic>) {
      return json.map((data) => Campaing.fromJson(data)).toList();
    }
    return null;
  }

  static List<Game>? _parseGames(dynamic json) {
    if (json != null && json is List<dynamic>) {
      return json.map((data) => Game.fromJson(data)).toList();
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alias': alias,
      'identityId': identityId,
      'birthDate': birthDate?.toIso8601String(),
      'imageUrl': imageUrl,
      'characters': characters?.map((character) => character.toJson()).toList(),
      'campaings': campaings?.map((campaing) => campaing.toJson()).toList(),
      'games': games?.map((game) => game.toJson()).toList(),
    };
  }
}