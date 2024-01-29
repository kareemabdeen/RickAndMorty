import 'package:get_it/get_it.dart';

import '../business_logic_layer/cubit/characters_cubit.dart';
import '../data/repository/character_repository.dart';
import '../data/web_services/charcters_webservices.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<CharacterswebServices>(
    () => CharacterswebServices(),
  );
  getIt.registerLazySingleton<CharacterRepository>(
    () => CharacterRepository(
      characterswebServices: CharacterswebServices(),
    ),
  );
  getIt.registerLazySingleton<CharactersCubit>(
    () => CharactersCubit(
      CharacterRepository(
        characterswebServices: CharacterswebServices(),
      ),
    ),
  );
}
