import 'package:graduation_project/features/profile/domain/entity/profile_entity.dart';



class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.uid,
    required super.name,
    required super.email,
    super.image,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> json) {
    return ProfileModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
email: json['email'] ?? '',
image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'image': image,
    };
  }
}