import '../entities/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:graduation_project/features/auth/domain/repo/auth_repo.dart';


@injectable
class CurrentUserUseCase {
  final AuthRepository repository;

  CurrentUserUseCase(this.repository);

  UserEntity? call() {
    return repository.getCurrentUser();
  }
}