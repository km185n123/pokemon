import 'package:equatable/equatable.dart';

class PokemonDetail extends Equatable {
  final int id;
  final String name;
  final String image;

  final List<String> types;

  final double height;
  final double weight;

  final String description;
  final String category;

  final String ability;

  final double malePercentage;
  final double femalePercentage;

  final List<String> weaknesses;

  const PokemonDetail({
    required this.id,
    required this.name,
    required this.image,
    required this.types,
    required this.height,
    required this.weight,
    required this.description,
    required this.category,
    required this.ability,
    required this.malePercentage,
    required this.femalePercentage,
    required this.weaknesses,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    types,
    height,
    weight,
    description,
    category,
    ability,
    malePercentage,
    femalePercentage,
    weaknesses,
  ];
}
