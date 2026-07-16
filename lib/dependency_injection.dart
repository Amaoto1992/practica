import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:practica1/src/presentation/home/cubit/home_cubit.dart';
import 'package:practica1/src/data/datasources/character_datasource.dart';
import 'package:practica1/src/domain/usecases/get_a_character_usecase.dart';
import 'package:practica1/src/domain/repositories/character_repository.dart';
import 'package:practica1/src/domain/usecases/get_all_characters_usecase.dart';
import 'package:practica1/src/data/datasources/character_datasource_impl.dart';
import 'package:practica1/src/data/repositories/character_repository_impl.dart';

GetIt getIt = GetIt.instance;

void setUpLocator() {
  //Data Sources
  getIt.registerLazySingleton<Client>(() => Client());
  getIt
      .registerLazySingleton<CharacterDatasource>(() => CharacterDatasourceImpl(
            client: getIt<Client>(),
          ));

  //Repositories
  getIt
      .registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(
            datasource: getIt<CharacterDatasource>(),
          ));

  //Use Cases
  getIt.registerLazySingleton<GetAllCharactersUseCase>(
      () => GetAllCharactersUseCase(
            repository: getIt<CharacterRepository>(),
          ));

  getIt.registerLazySingleton<GetACharacterUseCase>(() => GetACharacterUseCase(
        repository: getIt<CharacterRepository>(),
      ));

  //Cubit
  getIt.registerFactory<HomeCubit>(() => HomeCubit(
        allCharactersUseCase: getIt<GetAllCharactersUseCase>(),
        aCharacterUseCase: getIt<GetACharacterUseCase>(),
      ));
}
