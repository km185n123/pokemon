import 'package:flutter/material.dart';
import 'package:pokemon/core/config/constants.dart';
import 'package:pokemon/features/filters/presentation/widgets/filter_action_buttons.dart';
import 'package:pokemon/features/filters/presentation/widgets/filter_sheet_header.dart';
import 'package:pokemon/features/filters/presentation/widgets/filter_type_checkbox_list.dart';
import 'package:pokemon/features/filters/presentation/widgets/filter_type_header.dart';

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

  void _applyFilters() {
    widget.onApply(_selectedTypes);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final sortedKeys = Constants.typeTranslations.keys.toList()
      ..sort(
        (a, b) => Constants.typeTranslations[a]!.compareTo(
          Constants.typeTranslations[b]!,
        ),
      );

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          const FilterSheetHeader(),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  FilterTypeHeader(
                    isExpanded: _isTypeExpanded,
                    onToggle: () {
                      setState(() => _isTypeExpanded = !_isTypeExpanded);
                    },
                  ),
                  if (_isTypeExpanded)
                    FilterTypeCheckboxList(
                      sortedKeys: sortedKeys,
                      selectedTypes: _selectedTypes,
                      onToggle: _toggleType,
                    ),
                ],
              ),
            ),
          ),
          FilterActionButtons(onApply: _applyFilters),
        ],
      ),
    );
  }
}
