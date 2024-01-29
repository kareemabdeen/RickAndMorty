import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic_layer/cubit/characters_cubit.dart';
import '../../data/models/characters_model.dart';
import 'build_loadedlist.dart';
import 'custom_dialog.dart';
import 'show_loading_indicator.dart';

class BuildBlocBuilder extends StatefulWidget {
  const BuildBlocBuilder({
    super.key,
    required this.isSearched,
    required this.resultOfSearch,
    required this.searchTextControler,
  });
  final bool isSearched;
  final List<Character> resultOfSearch;
  final TextEditingController searchTextControler;
  @override
  State<BuildBlocBuilder> createState() => _BuildBlocBuilderState();
}

class _BuildBlocBuilderState extends State<BuildBlocBuilder> {
  late List<Character> allCharacters = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = (state)
            .characters; // assiging list of charcters in CharactersState .
        return BuildLoadedListWidgets(
          characters: widget.searchTextControler.text.isNotEmpty
              ? widget.resultOfSearch
              : allCharacters,
        );
      } else if (state is CharactersErrorCase) {
        return CustomDialog(
          message: state.errorMessage,
          title: 'Error Occured',
        );
      } else {
        return const ShowLoadingIndicator();
      }
    });
  }
}
