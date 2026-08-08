import '../repo/profile_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<void> call({
    required String name,
    String? image,
  }) {
    return repository.updateProfile(
      name: name,
      image: image,
    );
  }
}