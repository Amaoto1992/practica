import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:practica1/src/presentation/home/cubit/home_cubit.dart';
import 'package:practica1/src/data/datasources/naruto_datasource.dart';
import 'package:practica1/src/domain/repositories/naruto_repository.dart';
import 'package:practica1/src/data/datasources/naruto_datasource_impl.dart';
import 'package:practica1/src/data/repositories/naruto_repository_impl.dart';
import 'package:practica1/src/domain/usecases/get_naruto_characters_usecase.dart';
import 'package:practica1/src/domain/usecases/get_a_naruto_character_usecase.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  //Data Sources
  locator.registerLazySingleton<Client>(() => Client());
  locator.registerLazySingleton<NarutoDatasource>(
      () => NarutoDatasourceImpl(client: Client()));

  //Repositories
  locator.registerLazySingleton<NarutoRepository>(
      () => NarutoRepositoryImpl(datasource: locator<NarutoDatasource>()));

  //Use Cases
  locator.registerLazySingleton<GetANarutoCharacterUseCase>(() =>
      GetANarutoCharacterUseCase(repository: locator<NarutoRepository>()));
  locator.registerLazySingleton<GetNarutoCharactersUsecase>(() =>
      GetNarutoCharactersUsecase(repository: locator<NarutoRepository>()));

  //Cubits
  locator.registerLazySingleton<HomeCubit>(() => HomeCubit(
      getACharacter: locator<GetANarutoCharacterUseCase>(),
      getAllCharacters: locator<GetNarutoCharactersUsecase>()));
}
