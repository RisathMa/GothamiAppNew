import 'package:flutter/material.dart';

class FilterButtons<T> extends StatelessWidget {
  final List<T> categories;
  final T selectedCategory;
  final Function(T) onSelectCategory;
  final String Function(T) getDisplayName;

  const FilterButtons({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelectCategory,
    required this.getDisplayName,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: categories.map((category) {
        final isSelected = category == selectedCategory;
        return FilterChip(
          label: Text(
            getDisplayName(category),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
          ),
          selected: isSelected,
          onSelected: (selected) {
            if (selected) {
              onSelectCategory(category);
            }
          },
          backgroundColor: Colors.grey[100],
          selectedColor: Colors.blue[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide.none,
          ),
          showCheckmark: false,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        );
      }).toList(),
    );
  }
}