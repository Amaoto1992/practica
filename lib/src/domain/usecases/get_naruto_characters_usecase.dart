import 'package:practica1/src/domain/entities/naruto_entity.dart';
import 'package:practica1/src/domain/repositories/naruto_repository.dart';

class GetNarutoCharactersUsecase {
  final NarutoRepository repository;

  GetNarutoCharactersUsecase({required this.repository});

  Future<List<NarutoEntity>> call() async {
    return await repository.getNarutoCharacters();
  }
}
