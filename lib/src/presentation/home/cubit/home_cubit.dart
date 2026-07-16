import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/src/presentation/home/cubit/home_state.dart';
import 'package:practica1/src/domain/usecases/get_a_character_usecase.dart';
import 'package:practica1/src/domain/usecases/get_all_characters_usecase.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetACharacterUseCase aCharacterUseCase;
  final GetAllCharactersUseCase allCharactersUseCase;

  HomeCubit({
    required this.allCharactersUseCase,
    required this.aCharacterUseCase,
  }) : super(InitialState());

  Future<void> getAllCharacters() async {
    emit(LoadingState());
    try {
      final characters = await allCharactersUseCase();
      emit(
        LoadedState(characters: characters),
      );
    } catch (e) {
      emit(
        ErrorState(message: 'Failed to load characters $e'),
      );
    }
  }

  Future<void> getACharacter(int id) async {
    emit(LoadingState());
    try {
      final character = await aCharacterUseCase(id);
      emit(
        LoadedState(
          characters: [character],
        ),
      );
    } catch (e) {
      emit(
        ErrorState(message: 'Failed to load character $e'),
      );
    }
  }
}
