import 'package:injectable/injectable.dart';
import 'package:graduation_project/features/auth/domain/repo/auth_repo.dart';
@injectable
class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<void> call() {
    return repository.logout();
  }
}