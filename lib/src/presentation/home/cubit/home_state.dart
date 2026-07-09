import 'package:practica1/src/domain/entities/character_entity.dart';

sealed class HomeState {}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class LoadedState extends HomeState {
  LoadedState({required this.characters});
  final List<CharacterEntity> characters;
}

class ErrorState extends HomeState {
  ErrorState({required this.message});
  final String message;
}
