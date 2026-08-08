class ProfileEntity {
  final String uid;
  final String name;
  final String email;
  final String? image;

  const ProfileEntity({
    required this.uid,
    required this.name,
    required this.email,
    this.image,
  });
}