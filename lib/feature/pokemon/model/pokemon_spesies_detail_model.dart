import 'dart:convert';

class PokemonSpesiesDetailModel {
  int baseHappiness;
  int captureRate;
  Color color;
  List<Color> eggGroups;
  EvolutionChain evolutionChain;
  Color? evolvesFromSpecies;
  List<FlavorTextEntry> flavorTextEntries;
  List<dynamic> formDescriptions;
  bool formsSwitchable;
  int genderRate;
  List<Genus> genera;
  Color generation;
  Color growthRate;
  Color habitat;
  bool hasGenderDifferences;
  int hatchCounter;
  int id;
  bool isBaby;
  bool isLegendary;
  bool isMythical;
  String name;
  List<Name> names;
  int order;
  List<PalParkEncounter> palParkEncounters;
  List<PokedexNumber> pokedexNumbers;
  Color shape;
  List<Variety> varieties;

  PokemonSpesiesDetailModel({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });

  factory PokemonSpesiesDetailModel.fromRawJson(String str) =>
      PokemonSpesiesDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonSpesiesDetailModel.fromJson(Map<String, dynamic> json) =>
      PokemonSpesiesDetailModel(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        color: Color.fromJson(json["color"]),
        eggGroups:
            List<Color>.from(json["egg_groups"].map((x) => Color.fromJson(x))),
        evolutionChain: EvolutionChain.fromJson(json["evolution_chain"]),
        evolvesFromSpecies: json["evolves_from_species"] == null
            ? null
            : Color.fromJson(json["evolves_from_species"]),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        formDescriptions:
            List<dynamic>.from(json["form_descriptions"].map((x) => x)),
        formsSwitchable: json["forms_switchable"],
        genderRate: json["gender_rate"],
        genera: List<Genus>.from(json["genera"].map((x) => Genus.fromJson(x))),
        generation: Color.fromJson(json["generation"]),
        growthRate: Color.fromJson(json["growth_rate"]),
        habitat: Color.fromJson(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        order: json["order"],
        palParkEncounters: List<PalParkEncounter>.from(
            json["pal_park_encounters"]
                .map((x) => PalParkEncounter.fromJson(x))),
        pokedexNumbers: List<PokedexNumber>.from(
            json["pokedex_numbers"].map((x) => PokedexNumber.fromJson(x))),
        shape: Color.fromJson(json["shape"]),
        varieties: List<Variety>.from(
            json["varieties"].map((x) => Variety.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_happiness": baseHappiness,
        "capture_rate": captureRate,
        "color": color.toJson(),
        "egg_groups": List<dynamic>.from(eggGroups.map((x) => x.toJson())),
        "evolution_chain": evolutionChain.toJson(),
        "evolves_from_species": evolvesFromSpecies?.toJson(),
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
        "form_descriptions": List<dynamic>.from(formDescriptions.map((x) => x)),
        "forms_switchable": formsSwitchable,
        "gender_rate": genderRate,
        "genera": List<dynamic>.from(genera.map((x) => x.toJson())),
        "generation": generation.toJson(),
        "growth_rate": growthRate.toJson(),
        "habitat": habitat.toJson(),
        "has_gender_differences": hasGenderDifferences,
        "hatch_counter": hatchCounter,
        "id": id,
        "is_baby": isBaby,
        "is_legendary": isLegendary,
        "is_mythical": isMythical,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "order": order,
        "pal_park_encounters":
            List<dynamic>.from(palParkEncounters.map((x) => x.toJson())),
        "pokedex_numbers":
            List<dynamic>.from(pokedexNumbers.map((x) => x.toJson())),
        "shape": shape.toJson(),
        "varieties": List<dynamic>.from(varieties.map((x) => x.toJson())),
      };
}

class Color {
  String name;
  String url;

  Color({
    required this.name,
    required this.url,
  });

  factory Color.fromRawJson(String str) => Color.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class EvolutionChain {
  String url;

  EvolutionChain({
    required this.url,
  });

  factory EvolutionChain.fromRawJson(String str) =>
      EvolutionChain.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class FlavorTextEntry {
  String flavorText;
  Color language;
  Color version;

  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorTextEntry.fromRawJson(String str) =>
      FlavorTextEntry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Color.fromJson(json["language"]),
        version: Color.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language.toJson(),
        "version": version.toJson(),
      };
}

class Genus {
  String genus;
  Color language;

  Genus({
    required this.genus,
    required this.language,
  });

  factory Genus.fromRawJson(String str) => Genus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        genus: json["genus"],
        language: Color.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "genus": genus,
        "language": language.toJson(),
      };
}

class Name {
  Color language;
  String name;

  Name({
    required this.language,
    required this.name,
  });

  factory Name.fromRawJson(String str) => Name.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: Color.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language.toJson(),
        "name": name,
      };
}

class PalParkEncounter {
  Color area;
  int baseScore;
  int rate;

  PalParkEncounter({
    required this.area,
    required this.baseScore,
    required this.rate,
  });

  factory PalParkEncounter.fromRawJson(String str) =>
      PalParkEncounter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) =>
      PalParkEncounter(
        area: Color.fromJson(json["area"]),
        baseScore: json["base_score"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "area": area.toJson(),
        "base_score": baseScore,
        "rate": rate,
      };
}

class PokedexNumber {
  int entryNumber;
  Color pokedex;

  PokedexNumber({
    required this.entryNumber,
    required this.pokedex,
  });

  factory PokedexNumber.fromRawJson(String str) =>
      PokedexNumber.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokedexNumber.fromJson(Map<String, dynamic> json) => PokedexNumber(
        entryNumber: json["entry_number"],
        pokedex: Color.fromJson(json["pokedex"]),
      );

  Map<String, dynamic> toJson() => {
        "entry_number": entryNumber,
        "pokedex": pokedex.toJson(),
      };
}

class Variety {
  bool isDefault;
  Color pokemon;

  Variety({
    required this.isDefault,
    required this.pokemon,
  });

  factory Variety.fromRawJson(String str) => Variety.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variety.fromJson(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
        pokemon: Color.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "is_default": isDefault,
        "pokemon": pokemon.toJson(),
      };
}
