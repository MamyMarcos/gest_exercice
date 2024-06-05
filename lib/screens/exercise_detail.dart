import 'package:flutter/material.dart';
import 'exercise_detail.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<dynamic>> _exercises;

  @override
  void initState() {
    super.initState();
    _exercises = ApiService.getExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'GymHub',
          style: TextStyle(
            color: Color(0xFF001233),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Color(0xFFff5500)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color(0xFFFF5500),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder<List<dynamic>>(
                  future: _exercises,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('No exercises found');
                    } else {
                      final exercise = snapshot.data![0]; // Prenez le premier exercice par exemple
                      return Row(
                        children: [
                          Image.network(
                            exercise['image'], // Assurez-vous que l'API renvoie une URL d'image
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exercise['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  // Action lorsque le bouton est pressé
                                },
                                child: Text('Start Exercise'),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Mes exercices',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF001233),
              ),
            ),
            SizedBox(height: 16),
            // Liste d'exercices statiques remplacée par la liste d'exercices dynamique récupérée depuis l'API
            FutureBuilder<List<dynamic>>(
              future: _exercises,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No exercises found'));
                } else {
                  return Column(
                    children: List.generate(snapshot.data!.length, (index) {
                      final exercise = snapshot.data![index];
                      return ExerciseTile(
                        title: exercise['name'],
                        exercises: exercise['exerciseCount'],
                        minutes: exercise['duration'],
                      );
                    }),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFF5500),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline, color: Colors.white),
            label: 'Activité',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}

class ExerciseTile extends StatelessWidget {
  final String title;
  final int exercises;
  final int minutes;

  const ExerciseTile({
    required this.title,
    required this.exercises,
    required this.minutes,
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
          'assets/images/exercise.png', // Assurez-vous que l'image est dans le bon chemin
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
