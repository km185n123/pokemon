import 'package:flutter/material.dart';

class DetailGenderBar extends StatelessWidget {
  const DetailGenderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'GENERO',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.pinkAccent, // Female base color
          ),
          child: Row(
            children: [
              Expanded(
                flex: 875, // 87.5% Male
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Expanded(
                flex:
                    125, // 12.5% Female (rest of the bar is already pink so we just leave it transparent or color it)
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.male, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  '87,5%',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.female, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  '12,5%',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
