class Profile {
  final String id;
  final String username;
  final String displayName;
  final String avatarUrl;
  final String bio;
  final int followerCount;
  final int followingCount;

  const Profile({
    required this.id,
    required this.username,
    required this.displayName,
    this.avatarUrl = '',
    this.bio = '',
    this.followerCount = 0,
    this.followingCount = 0,
  });
}
