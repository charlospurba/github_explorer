class User {
  final String username;
  final String name;
  final String bio;
  final int followers;
  final int following;

  User({
    required this.username,
    required this.name,
    required this.bio,
    required this.followers,
    required this.following,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['login'] ?? 'Unknown',
      name: json['name'] ?? 'No name',
      bio: json['bio'] ?? 'No bio',
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
    );
  }
}
