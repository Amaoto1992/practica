import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/src/presentation/home/cubit/home_state.dart';
import 'package:practica1/src/domain/usecases/get_a_character_usecase.dart';
import 'package:practica1/src/domain/usecases/get_all_characters_usecase.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetACharacterUsecase aCharacterUsecase;
  final GetAllCharactersUsecase allCharactersUsecase;

  HomeCubit(this.aCharacterUsecase, this.allCharactersUsecase)
    : super(InitialState());

  Future<void> getACharacter(String id) async {
    emit(LoadingState());
    try {
      final result = await aCharacterUsecase(id);
      result.fold(
        (failure) => emit(ErrorState(message: failure.message)),
        (character) => emit(LoadedState(characters: [character])),
      );
    } catch (error) {
      emit(ErrorState(message: 'Failed in cubit $error'));
    }
  }

  Future<void> getAllCharacters() async {
    emit(LoadingState());
    try {
      final result = await allCharactersUsecase();
      result.fold(
        (failure) => emit(ErrorState(message: failure.message)),
        (characters) => emit(LoadedState(characters: characters)),
      );
    } catch (error) {
      emit(ErrorState(message: 'Failed in cubit $error'));
    }
  }
}
