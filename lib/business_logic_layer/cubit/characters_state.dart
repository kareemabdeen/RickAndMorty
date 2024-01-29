// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;
  CharactersLoaded({
    required this.characters, // this list passed from charcters_cubit
  });
}

class CharactersErrorCase extends CharactersState {
  final String errorMessage;
  CharactersErrorCase({
    required this.errorMessage,
  });
}

class SearcheIsDone extends CharactersState {
  final List<Character> characters;
  SearcheIsDone({
    required this.characters, // this list passed from charcters_cubit
  });
}
