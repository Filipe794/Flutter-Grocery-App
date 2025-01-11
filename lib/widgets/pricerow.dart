import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  final String label;
  final double value;

  const PriceRow({required this.label, required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Text('\$${value.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
