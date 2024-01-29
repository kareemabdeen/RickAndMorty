import '../models/characters_model.dart';
import '../web_services/charcters_webservices.dart';

// webServices class passes data to Repository
class CharacterRepository {
  final CharacterswebServices characterswebServices;

  CharacterRepository({required this.characterswebServices});

  Future<List<Character>> getAllcharctersRequest() async {
    // we must map it to adart object
    final mapOFCharcters =
        await characterswebServices.getAllCharactersRequest(); // web services

    final List<dynamic> charcters =
        mapOFCharcters["results"]; // map the result key only not info section

    return charcters
        .map<Character>((charcater) => Character.fromJson(charcater))
        .toList(); // map each object in our list in my character model class
  }
}
