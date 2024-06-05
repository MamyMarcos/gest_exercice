import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ExerciseDetailPage extends StatefulWidget {
  final int exerciseId;

  ExerciseDetailPage({required this.exerciseId});

  @override
  _ExerciseDetailPageState createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  late Future<Map<String, dynamic>> _exerciseDetail;

  @override
  void initState() {
    super.initState();
    _exerciseDetail = ApiService.getExerciseDetail(widget.exerciseId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Detail'),
        backgroundColor: Color(0xFF001233),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _exerciseDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            final exercise = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise['name'],
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF001233),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    exercise['description'],
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF001233),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Type: ${exercise['type']}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF001233),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Recommended Duration: ${exercise['durationRecommended']} minutes',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF001233),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
