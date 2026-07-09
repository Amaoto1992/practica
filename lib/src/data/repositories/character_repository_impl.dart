import 'package:dartz/dartz.dart';
import 'package:practica1/src/domain/entities/failure.dart';
import 'package:practica1/src/domain/entities/server_failure.dart';
import 'package:practica1/src/domain/entities/character_entity.dart';
import 'package:practica1/src/data/datasources/character_datasource.dart';
import 'package:practica1/src/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl(this.datasource);
  final CharacterDatasource datasource;

  @override
  Future<Either<Failure, CharacterEntity>> getACharacter(String id) async {
    try {
      final character = await datasource.getACharacter(id);
      return Right(character);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters() async {
    try {
      final characters = await datasource.getAllCharacters();
      return Right(characters);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
