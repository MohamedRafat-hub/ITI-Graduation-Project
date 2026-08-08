import 'package:graduation_project/features/profile/domain/entity/profile_entity.dart';



abstract class ProfileRepository {
  Future<ProfileEntity> getProfile();

  Future<void> updateProfile({
    required String name,
    String? image,
  });
}