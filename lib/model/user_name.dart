
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
}
