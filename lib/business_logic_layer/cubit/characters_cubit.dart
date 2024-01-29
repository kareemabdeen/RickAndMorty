import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/characters_model.dart';
import '../../data/repository/character_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  late List<Character> characters = [];
  CharactersCubit(
    this.characterRepository,
  ) : super(CharactersInitial());

  // emit state: means that i call ui to recieve the data , recieve data from characterRepository

  //this function mainly for recieving data from repositorylayer and send data to ui layer
  List<Character> fethAllCharactersData() {
    try {
      characterRepository.getAllcharctersRequest().then((characters) {
        emit(CharactersLoaded(
          characters: characters,
        )); //emit state to ui to send data that comes from repostory to ui , to start use it
        this.characters = characters;
      });
      return characters;
    } catch (e) {
      emit(
        CharactersErrorCase(
          errorMessage: e.toString(),
        ),
      );
      return [];
    }
  }
  // now this function is ready to send/return list<characters> to ui layery
}
