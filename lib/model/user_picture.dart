class UserPicture {
  final String medium;
  final String large;
  final String thumbnail;

  UserPicture({
    required this.medium,
    required this.large,
    required this.thumbnail,
  });

  factory UserPicture.fromJson(Map<String, dynamic> json) {
    return UserPicture(
      medium: json['medium'] ?? '',
      large: json['large'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}