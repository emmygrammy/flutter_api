
class FullName {
  final String title;
  final String first;
  final String last;

  FullName({
    required this.title,
    required this.first,
    required this.last,
  });

  String get fullName {
    return '$title $first $last';
  }

  factory FullName.fromJson(Map<String, dynamic> json) {
    return FullName(
      title: json['title'] ?? '',
      first: json['first'] ?? '',
      last: json['last'] ?? '',
    );
  }
}
