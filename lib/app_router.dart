import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Global/depedency_injection.dart';
import 'business_logic_layer/cubit/characters_cubit.dart';
import 'constants/constants.dart';
import 'data/models/characters_model.dart';
import 'data/repository/character_repository.dart';
import 'presentation_layer/views/allcharacters_view.dart';
import 'presentation_layer/views/characters_details._view.dart';
import 'presentation_layer/views/splashscreen_view.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;

  // AppRouter() {
  //   characterRepository = CharacterRepository(
  //     characterswebServices: CharacterswebServices(),
  //   );
  //   charactersCubit = CharactersCubit(
  //     characterRepository,
  //   );
  // }

  //* : Applying dependency injection here

  AppRouter() {
    characterRepository = getIt.get<CharacterRepository>();
    charactersCubit = getIt.get<CharactersCubit>();
  }

  Route<dynamic>? generateRoutes(RouteSettings settings) {
    var routName = settings.name;
    switch (routName) {
      case ksplashScreen: // '/' represents home route or adefault route the route which built when the user open the app
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case kAllCharactersScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            // default when the bloc creates lazy: true until ui needs instance of bloc so call it by blocProvider.of(context).. so changes its states to lazy :false  ,
            create: (BuildContext context) =>
                charactersCubit..fethAllCharactersData(),
            child: const CharactersScreen(),
          ),
        );

      case kCharacterDetailsScreen:
        final selectedCharacter = settings.arguments
            as Character; // this for accessing the character that passed when user clicked on charcetrItem widget
        return MaterialPageRoute(
            builder: (_) =>
                CharactersDetailsScreen(character: selectedCharacter));
    }
    return null;
  }
}
