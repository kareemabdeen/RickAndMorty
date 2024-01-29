class Character {
  
  int? id;
  String? name;
  String? statuesIfDeadOrLife;
  String? species;
  String? gender;
  String? image;
  String? created;
  String? url;
  List<String>? episode;
  Origin? origin;
  Location? location;

  Character({
    required this.name,
    required this.id,
    required this.gender,
    required this.image,
    required this.species,
    required this.created,
    required this.episode,
    required this.statuesIfDeadOrLife,
    required this.url,
    required this.origin,
    required this.location,
  });
  factory Character.fromJson(Map<String, dynamic> jsondata) {
    return Character(
      name: jsondata['name'] ?? "kareem",
      id: jsondata['id'] ?? 2002,
      gender: jsondata['gender'] ?? "male",
      image: jsondata['image'],
      species: jsondata['species'] ?? "alive", //toDo check this again
      created: jsondata['created'] ?? "14-2-2002",
      episode: jsondata['episode'].cast<
          String>(), // some of mapping not getting as string so we cast the returned values
      statuesIfDeadOrLife: jsondata['status'] ?? "alive",
      url: jsondata['url'] ?? "mdskmsndm",
      origin: Origin.fromJson(jsondata['origin'] ?? {"kareem": "dbdfb"}),
      location: Location.fromJson(
        jsondata['location'] ?? {"america": "dbdfb"},
      ),
    );
  }
}

class Origin {
  String? name, url;
  Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String,dynamic> jsondata) {
    return Origin(
      name: jsondata['name'] ?? "america",
      url: jsondata['url'] ?? "hsdabdkjak",
    );
  }
}

class Location {
  String? name, url;
  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> jsondata) {
    return Location(
      name: jsondata['name'],
      url: jsondata['url'],
    );
  }
}
