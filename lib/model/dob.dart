class UsersDob {
  final DateTime date;
  final int age;

  UsersDob({
    required this.date,
    required this.age,
  });

  factory UsersDob.fromJson(Map<String, dynamic> json) {
    return UsersDob(
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
      age: json['age'] ?? 0,
    );
  }
}
