import 'package:flutter/material.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final Color color;
  final bool isSelected;

  const TaskCard({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.access_time, color: Colors.white, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Created at $date',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
