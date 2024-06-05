import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final String title;
  final int exercises;
  final int minutes;
  final String imagePath;

  const ExerciseTile({
    required this.title,
    required this.exercises,
    required this.minutes,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: Image.asset(
          imagePath, // Assurez-vous que l'image est dans le bon chemin
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF001233),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '$exercises Exercises • $minutes Min',
          style: const TextStyle(
            color: Color(0xFF001233),
            fontSize: 14,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF001233)),
        onTap: () {
          // Action lorsque l'élément est tapé
        },
      ),
    );
  }
}
