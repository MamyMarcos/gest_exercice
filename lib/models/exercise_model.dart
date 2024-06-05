class Exercise {
  final int id;
  final String name;
  final String description;
  final String type;
  final int durationRecommended;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.durationRecommended,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'] ?? 'No Name',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      durationRecommended: json['durationRecommended'] ?? 0,
    );
  }
}
