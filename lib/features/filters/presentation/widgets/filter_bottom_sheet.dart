import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  final List<String> initialSelectedTypes;
  final Function(List<String>) onApply;

  const FilterBottomSheet({
    super.key,
    required this.initialSelectedTypes,
    required this.onApply,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late List<String> _selectedTypes;
  bool _isTypeExpanded = true;

  // Map backend types to Spanish labels for the UI
  static const Map<String, String> _typeTranslations = {
    'water': 'Agua',
    'bug': 'Bicho',
    'dragon': 'Dragón',
    'electric': 'Eléctrico',
    'ghost': 'Fantasma',
    'fire': 'Fuego',
    'fairy': 'Hada',
    'ice': 'Hielo',
    'fighting': 'Lucha',
    'normal': 'Normal',
    'grass': 'Planta',
    'psychic': 'Psíquico',
    'rock': 'Roca',
    'dark': 'Siniestro',
    'ground': 'Tierra',
    'poison': 'Veneno',
    'flying': 'Volador',
    'steel': 'Acero',
  };

  @override
  void initState() {
    super.initState();
    _selectedTypes = List.from(widget.initialSelectedTypes);
  }

  void _toggleType(String typeKey) {
    setState(() {
      if (_selectedTypes.contains(typeKey)) {
        _selectedTypes.remove(typeKey);
      } else {
        _selectedTypes.add(typeKey);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Sort types alphabetically by their Spanish translation for better UX
    final sortedKeys = _typeTranslations.keys.toList()
      ..sort((a, b) => _typeTranslations[a]!.compareTo(_typeTranslations[b]!));

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      height:
          MediaQuery.of(context).size.height * 0.85, // Takes up 85% of screen
      child: Column(
        children: [
          // Header with close button and title
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black87),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Expanded(
                  child: Text(
                    'Filtra por tus preferencias',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 48,
                ), // To balance the close icon for centering
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // "Tipo" Header
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isTypeExpanded = !_isTypeExpanded;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tipo',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Icon(
                            _isTypeExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1, color: Colors.black12),
                  // List of Types
                  if (_isTypeExpanded)
                    ...sortedKeys.map((key) {
                      final isSelected = _selectedTypes.contains(key);
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          _typeTranslations[key]!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        value: isSelected,
                        onChanged: (value) => _toggleType(key),
                        activeColor: const Color(
                          0xFF3B82F6,
                        ), // Blue matching design
                        checkColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                      );
                    }).toList(),
                ],
              ),
            ),
          ),
          // Fixed Bottom Buttons
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.black12, width: 1)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onApply(_selectedTypes);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6), // Blue button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Aplicar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          Colors.grey.shade100, // Light grey background
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
