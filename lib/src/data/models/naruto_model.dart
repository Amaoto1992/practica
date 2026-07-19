import 'package:practica1/src/domain/entities/naruto_entity.dart';

class NarutoModel extends NarutoEntity {
  NarutoModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory NarutoModel.fromJson(Map<String, dynamic> json) {
    return NarutoModel(
      id: json['id'],
      name: json['name'],
      image: (json['images'] as List?)?.isNotEmpty == true
          ? json['images'][0] as String
          : '',
    );
  }
}
