import 'package:practica1/src/domain/entities/naruto_entity.dart';

sealed class HomeState {}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class LoadedState extends HomeState {
  final List<NarutoEntity> characters;

  LoadedState({required this.characters});
}

class ErrorState extends HomeState {
  final String message;

  ErrorState({required this.message});
}
