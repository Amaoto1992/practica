import 'package:practica1/src/domain/entities/naruto_entity.dart';
import 'package:practica1/src/domain/repositories/naruto_repository.dart';

class GetANarutoCharacterUseCase {
  final NarutoRepository repository;

  GetANarutoCharacterUseCase({required this.repository});

  Future<NarutoEntity> call(int id) async {
    return await repository.getANarutoCharacter(id);
  }
}
