import 'package:injectable/injectable.dart';
import 'package:graduation_project/features/profile/domain/repo/profile_repo.dart';
import 'package:graduation_project/features/profile/domain/entity/profile_entity.dart';
import 'package:graduation_project/features/profile/data/data_source/profile_remote.dart';


@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remote;

  ProfileRepositoryImpl(this.remote);

  @override
  Future<ProfileEntity> getProfile() {
    return remote.getProfile();
  }

  @override
  Future<void> updateProfile({
    required String name,
    String? image,
  }) {
    return remote.updateProfile(
      name: name,
      image: image,
    );
  }
}