import 'package:practica1/src/domain/entities/character_entity.dart';

sealed class DetailState {}

class DetailInitialState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadedState extends DetailState {
  DetailLoadedState({required this.character});
  final CharacterEntity character;
}

class DetailErrorState extends DetailState {
  DetailErrorState({required this.message});
  final String message;
}
