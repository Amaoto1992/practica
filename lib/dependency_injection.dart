import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:practica1/src/presentation/home/cubit/home_cubit.dart';
import 'package:practica1/src/presentation/detail/cubit/detail_cubit.dart';
import 'package:practica1/src/data/datasources/character_datasource.dart';
import 'package:practica1/src/domain/usecases/get_a_character_usecase.dart';
import 'package:practica1/src/domain/repositories/character_repository.dart';
import 'package:practica1/src/domain/usecases/get_all_characters_usecase.dart';
import 'package:practica1/src/data/datasources/character_datasource_impl.dart';
import 'package:practica1/src/data/repositories/character_repository_impl.dart';

GetIt sl = GetIt.instance;

void setUpLocator() {
  //Datasources
  sl.registerLazySingleton<Client>(() => Client());
  sl.registerLazySingleton<CharacterDatasource>(
    () => CharacterDatasourceImpl(sl<Client>()),
  );

  //Repositories
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(sl<CharacterDatasource>()),
  );

  //Usecases
  sl.registerLazySingleton<GetACharacterUsecase>(
    () => GetACharacterUsecase(sl<CharacterRepository>()),
  );
  sl.registerLazySingleton<GetAllCharactersUsecase>(
    () => GetAllCharactersUsecase(sl<CharacterRepository>()),
  );

  //BloC
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
        sl<GetACharacterUsecase>(),
        sl<GetAllCharactersUsecase>(),
    ),
  );
  sl.registerFactory<DetailCubit>(
    () => DetailCubit(sl<GetACharacterUsecase>()),
  );
}
