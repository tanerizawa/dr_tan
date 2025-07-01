import 'package:flutter/material.dart';

class DynamicTagSuggestion extends StatelessWidget {
  final List<String> tags;
  final Function(String) onTagSelected;
  const DynamicTagSuggestion({super.key, required this.tags, required this.onTagSelected});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: tags.map((tag) {
        return ActionChip(
          label: Text('#$tag'),
          onPressed: () => onTagSelected(tag),
        );
      }).toList(),
    );
  }
}
