import 'package:flutter/material.dart';
import 'package:pokemon/core/config/constants.dart';

class FilterTypeCheckboxList extends StatelessWidget {
  final List<String> sortedKeys;
  final List<String> selectedTypes;
  final ValueChanged<String> onToggle;

  const FilterTypeCheckboxList({
    super.key,
    required this.sortedKeys,
    required this.selectedTypes,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sortedKeys.map((key) {
        final isSelected = selectedTypes.contains(key);
        final label = Constants.typeTranslations[key] ?? key;
        return CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          value: isSelected,
          onChanged: (_) => onToggle(key),
          activeColor: const Color(0xFF3B82F6),
          checkColor: Colors.white,
          controlAffinity: ListTileControlAffinity.trailing,
        );
      }).toList(),
    );
  }
}
