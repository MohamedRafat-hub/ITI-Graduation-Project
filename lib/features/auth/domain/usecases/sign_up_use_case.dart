import '../entities/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:graduation_project/features/auth/domain/repo/auth_repo.dart';

@injectable
class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<UserEntity> call({
    required String email,
    required String password,
  }) {
    return repository.signUp(
      email: email,
      password: password,
      name: '',
    );
  }
}