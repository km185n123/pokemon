import 'package:flutter/material.dart';

class PokemonColorUtils {
  static Color getColorByType(String type) {
    final darkerColor = getDarkerColorByType(type);
    return Color.lerp(darkerColor, Colors.white, 0.5) ?? darkerColor;
  }

  static Color getDarkerColorByType(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return const Color(0xFF8BC34A);
      case 'fire':
        return const Color(0xFFFF9800);
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
