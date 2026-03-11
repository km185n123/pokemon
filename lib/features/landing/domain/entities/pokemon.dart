import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final String image;
  final List<String> types;
  final bool isFavorite;

  const Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.types,
    this.isFavorite = false,
  });

  Pokemon copyWith({
    int? id,
    String? name,
    String? image,
    List<String>? types,
    bool? isFavorite,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      types: types ?? this.types,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [id, name, image, types, isFavorite];
}
