import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/src/presentation/detail/cubit/detail_state.dart';
import 'package:practica1/src/domain/usecases/get_a_character_usecase.dart';

class DetailCubit extends Cubit<DetailState> {
  final GetACharacterUsecase aCharacterUsecase;

  DetailCubit(this.aCharacterUsecase) : super(DetailInitialState());

  Future<void> getACharacter(String id) async {
    emit(DetailLoadingState());
    try {
      final result = await aCharacterUsecase(id);
      result.fold(
        (failure) => emit(DetailErrorState(message: failure.message)),
        (character) => emit(DetailLoadedState(character: character)),
      );
    } catch (error) {
      emit(DetailErrorState(message: 'Failed in cubit $error'));
    }
  }
}
