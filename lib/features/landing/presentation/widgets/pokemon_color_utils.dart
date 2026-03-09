import 'package:flutter/material.dart';

class PokemonColorUtils {
  static Color getColorByType(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return const Color(0xFFA8DAB5); // Light green
      case 'fire':
        return const Color(0xFFFFB74D); // Orange
      case 'water':
        return const Color(0xFF81D4FA); // Light blue
      case 'electric':
        return const Color(0xFFFFD54F); // Yellow
      case 'poison':
        return const Color(0xFFCE93D8); // Purple
      case 'bug':
        return const Color(0xFFC5E1A5); // Light yellow-green
      case 'normal':
        return const Color(0xFFE0E0E0); // Grey
      case 'fairy':
        return const Color(0xFFF48FB1); // Pink
      case 'fighting':
        return const Color(0xFFEF9A9A); // Light red
      case 'psychic':
        return const Color(0xFFF48FB1); // Light pink
      case 'rock':
        return const Color(0xFFD7CCC8); // Brown
      case 'ground':
        return const Color(0xFFBCAAA4); // Darker brown
      case 'ghost':
        return const Color(0xFFB39DDB); // Dark purple
      case 'ice':
        return const Color(0xFFB2EBF2); // Cyan
      case 'dragon':
        return const Color(0xFF9FA8DA); // Indigo
      case 'dark':
        return const Color(0xFF9E9E9E); // Dark grey
      case 'steel':
        return const Color(0xFFB0BEC5); // Blue grey
      case 'flying':
        return const Color(0xFF90CAF9); // Sky blue
      default:
        return const Color(0xFFE0E0E0); // Default grey
    }
  }

  static Color getDarkerColorByType(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return const Color(0xFF6CC873);
      case 'fire':
        return const Color(0xFFFA9C1B);
      case 'water':
        return const Color(0xFF29B6F6);
      case 'electric':
        return const Color(0xFFFFCA28);
      case 'poison':
        return const Color(0xFFAB47BC);
      case 'bug':
        return const Color(0xFF9CCC65);
      case 'normal':
        return const Color(0xFF9E9E9E);
      case 'fairy':
        return const Color(0xFFF06292);
      case 'fighting':
        return const Color(0xFFE57373);
      case 'psychic':
        return const Color(0xFFF06292);
      case 'rock':
        return const Color(0xFFA1887F);
      case 'ground':
        return const Color(0xFF8D6E63);
      case 'ghost':
        return const Color(0xFF7E57C2);
      case 'ice':
        return const Color(0xFF4DD0E1);
      case 'dragon':
        return const Color(0xFF5C6BC0);
      case 'dark':
        return const Color(0xFF616161);
      case 'steel':
        return const Color(0xFF78909C);
      case 'flying':
        return const Color(0xFF42A5F5);
      default:
        return const Color(0xFF9E9E9E);
    }
  }

  static IconData getIconByType(String type) {
    // simplified icons for types
    switch (type.toLowerCase()) {
      case 'grass':
        return Icons.eco;
      case 'fire':
        return Icons.local_fire_department;
      case 'water':
        return Icons.water_drop;
      case 'electric':
        return Icons.flash_on;
      case 'poison':
        return Icons.science; // approximation
      case 'bug':
        return Icons.bug_report;
      case 'flying':
        return Icons.air;
      default:
        return Icons.circle;
    }
  }
}
