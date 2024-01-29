import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../business_logic_layer/cubit/characters_cubit.dart';
import '../../constants/mycolors.dart';
import '../../data/models/characters_model.dart';
import '../widgets/basic_appbar.dart';
import '../widgets/build_blocbuilder.dart';
import '../widgets/no_internet_widget.dart';
import '../widgets/show_loading_indicator.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   i have trigerred it by spread operator when creating cubit object in appRouter
  //   BlocProvider.of<CharactersCubit>(context).fethAllCharactersData();
  // }

  bool isSearched = false;
  List<Character> searchedCharcters = [];
  final TextEditingController searchTextControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Character> allCharacters =
        BlocProvider.of<CharactersCubit>(context).characters;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        leading: isSearched
            ? IconButton(
                onPressed: () {
                  setState(
                    () {
                      isSearched = false;
                      // const BuildBasicAppbarTitle();
                    },
                  );
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: MyColors.myGrey,
                ),
              )
            : Container(
                color: Colors.transparent,
              ),
        title: !isSearched
            ? const BuildBasicAppbarTitle()
            : makeAsearchOnUserInput(allCharacters),
        actions: buildAppBarActons(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BuildBlocBuilder(
              isSearched: isSearched,
              resultOfSearch: searchedCharcters,
              searchTextControler: searchTextControler,
            );
          } else {
            return const NoInternet();
          }
        },
        child: const ShowLoadingIndicator(),
      ),
    );
  }

  TextField makeAsearchOnUserInput(List<Character> allCharacters) {
    return TextField(
      controller: searchTextControler,
      decoration: const InputDecoration(
        hintText: " Find a Character...",
        hintStyle: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(144, 52, 58, 64),
          fontWeight: FontWeight.w600,
        ),
        border: InputBorder.none,
      ),
      cursorColor: MyColors.myGrey,

      autofocus: true, //Display the keyboard when TextField is displayed
      onChanged: (userInput) {
        addSearchResultToSearchedList(allCharacters, userInput);

        setState(
          () {},
        );
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
    );
  }

  void addSearchResultToSearchedList(
      List<Character> allCharacters, String userInput) {
    searchedCharcters = allCharacters
        .where(
          (character) => character.name!.toLowerCase().startsWith(
                userInput.toLowerCase(),
              ),
        )
        .toList();
  }

  List<Widget> buildAppBarActons() {
    if (!isSearched) {
      return [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
          onPressed: () {
            setState(
              () {
                isSearched = true;
                searchedCharcters = [];
              },
            );
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(
            Icons.clear,
            color: MyColors.myGrey,
          ),
          onPressed: () {
            clearLastUserInput();
            setState(() {
              isSearched = false;
            });
          },
        ),
      ];
    }
  }

  void clearLastUserInput() {
    searchTextControler.clear();
  }
}
