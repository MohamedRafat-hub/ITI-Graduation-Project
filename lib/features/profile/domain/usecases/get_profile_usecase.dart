import '../repo/profile_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:graduation_project/features/profile/domain/entity/profile_entity.dart';




@injectable
class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<ProfileEntity> call() {
    return repository.getProfile();
  }
}