import '../entities/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:graduation_project/features/auth/domain/repo/auth_repo.dart';


@injectable
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> call({
    required String email,
    required String password,
  }) {
    return repository.login(
      email: email,
      password: password,
    );
  }
}