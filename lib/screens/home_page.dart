import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Fixez vos objectifs de mise en forme',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: null,
                          
                          child: Text('Start Exercise'),
                        ),
                      ],
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/images/exercise.png', // Assurez-vous que l'image est dans le bon chemin
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Mes exercices',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF001233),
              ),
            ),
            const SizedBox(height: 16),
            ExerciseTile(
              title: 'Full Body Warm Up',
              exercises: 20,
              minutes: 22,
            ),
            ExerciseTile(
              title: 'Strength Exercise',
              exercises: 12,
              minutes: 14,
            ),
            ExerciseTile(
              title: 'Both Side Plank',
              exercises: 15,
              minutes: 18,
            ),
            ExerciseTile(
              title: 'Abs Workout',
              exercises: 16,
              minutes: 18,
            ),
            ExerciseTile(
              title: 'Torso and Trap Workout',
              exercises: 8,
              minutes: 10,
            ),
            ExerciseTile(
              title: 'Lower Back Exercise',
              exercises: 14,
              minutes: 18,
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
