import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/src/presentation/home/cubit/home_state.dart';
import 'package:practica1/src/domain/usecases/get_naruto_characters_usecase.dart';
import 'package:practica1/src/domain/usecases/get_a_naruto_character_usecase.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetANarutoCharacterUseCase getACharacter;
  final GetNarutoCharactersUsecase getAllCharacters;
  HomeCubit({
    required this.getACharacter,
    required this.getAllCharacters,
  }) : super(InitialState());

  Future<void> fetchACharacter(int id) async {
    emit(LoadingState());
    try {
      final character = await getACharacter(id);
      emit(
        LoadedState(characters: [character]),
      );
    } catch (error) {
      emit(ErrorState(message: 'Failed to fetch character: $error'));
    }
  }

  Future<void> fetchAllCharacters() async {
    emit(LoadingState());
    try {
      final characters = await getAllCharacters();
      emit(
        LoadedState(characters: characters),
      );
    } catch (error) {
      emit(ErrorState(message: 'Failed to fetch characters: $error'));
    }
  }
}
