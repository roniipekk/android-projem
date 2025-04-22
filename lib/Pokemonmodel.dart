// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) => PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  List<Pokemon> pokemon;

  PokemonModel({
    required this.pokemon,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
    pokemon: List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
  };
}

class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<Type> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<Type> weaknesses;
  List<Evolution> nextEvolution;
  List<Evolution> prevEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
    required this.prevEvolution,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    id: json["id"],
    num: json["num"].toString(), // num'u her zaman String yap
    name: json["name"],
    img: json["img"],
    type: List<Type>.from(json["type"].map((x) => typeValues.map[x])),
    height: json["height"],
    weight: json["weight"],
    candy: json["candy"],
    candyCount: json["candy_count"] ?? 0, // Eğer null ise 0 yap
    spawnChance: (json["spawn_chance"] ?? 0).toDouble(),
    avgSpawns: (json["avg_spawns"] ?? 0).toDouble(),
    spawnTime: json["spawn_time"] ?? "00:00",
    multipliers: json["multipliers"] != null
        ? List<double>.from(json["multipliers"].map((x) => x.toDouble()))
        : [], // Null kontrolü
    weaknesses: List<Type>.from(json["weaknesses"].map((x) => typeValues.map[x])),
    nextEvolution: json["next_evolution"] != null
        ? List<Evolution>.from(json["next_evolution"].map((x) => Evolution.fromJson(x)))
        : [],
    prevEvolution: json["prev_evolution"] != null
        ? List<Evolution>.from(json["prev_evolution"].map((x) => Evolution.fromJson(x)))
        : [],
  );



  Map<String, dynamic> toJson() => {
    "id": id,
    "num": num,
    "name": name,
    "img": img,
    "type": List<dynamic>.from(type.map((x) => typeValues.reverse[x])),
    "height": height,
    "weight": weight,
    "candy": candy,
    "candy_count": candyCount,
    "spawn_chance": spawnChance,
    "avg_spawns": avgSpawns,
    "spawn_time": spawnTime,
    "multipliers": List<dynamic>.from(multipliers.map((x) => x)),
    "weaknesses": List<dynamic>.from(weaknesses.map((x) => typeValues.reverse[x])),
    "next_evolution": List<dynamic>.from(nextEvolution.map((x) => x.toJson())),
    "prev_evolution": List<dynamic>.from(prevEvolution.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Pokemon{weaknesses: $weaknesses}';
  }

// @override
 // String toString() {
    //return 'Pokemon{id: $id, name: $name, num: $num, type: $type}';
 // }


}


class Evolution {
  String num;
  String name;

  Evolution({
    required this.num,
    required this.name,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
    num: json["num"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "num": num,
    "name": name,
  };

  @override
  String toString() {
    return '$name';
  }
}

enum Type {
  BUG,
  DARK,
  DRAGON,
  ELECTRIC,
  FAIRY,
  FIGHTING,
  FIRE,
  FLYING,
  GHOST,
  GRASS,
  GROUND,
  ICE,
  NORMAL,
  POISON,
  PSYCHIC,
  ROCK,
  STEEL,
  WATER
}

final typeValues = EnumValues({
  "Bug": Type.BUG,
  "Dark": Type.DARK,
  "Dragon": Type.DRAGON,
  "Electric": Type.ELECTRIC,
  "Fairy": Type.FAIRY,
  "Fighting": Type.FIGHTING,
  "Fire": Type.FIRE,
  "Flying": Type.FLYING,
  "Ghost": Type.GHOST,
  "Grass": Type.GRASS,
  "Ground": Type.GROUND,
  "Ice": Type.ICE,
  "Normal": Type.NORMAL,
  "Poison": Type.POISON,
  "Psychic": Type.PSYCHIC,
  "Rock": Type.ROCK,
  "Steel": Type.STEEL,
  "Water": Type.WATER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }




}
