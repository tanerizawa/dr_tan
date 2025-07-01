import 'package:flutter/material.dart';

class InsightRatingWidget extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const InsightRatingWidget({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (i) {
        return IconButton(
          icon: Icon(
            i < value ? Icons.star : Icons.star_border,
            color: Colors.orange,
          ),
          onPressed: () => onChanged(i + 1),
        );
      }),
    );
  }
}
