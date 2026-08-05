import '../models/user_model.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user_entity.dart';
import 'package:graduation_project/features/auth/domain/repo/auth_repo.dart';
import 'package:graduation_project/features/auth/data/datasource/auth_remote.dart';
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final user = await remoteDataSource.signUp(
      email: email,
      password: password,
      name: name,
    );

    return UserModel.fromFirebase(
      uid: user.uid,
      email: user.email ?? '',
      name: name,
    );
  }

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final user = await remoteDataSource.login(
      email: email,
      password: password,
    );

    return UserModel.fromFirebase(
      uid: user.uid,
      email: user.email ?? '',
      name: '',
    );
  }

  @override
  Future<void> logout() {
    return remoteDataSource.logout();
  }

  @override
  UserEntity? getCurrentUser() {
    final user = remoteDataSource.getCurrentUser();

    if (user == null) return null;

    return UserModel.fromFirebase(
      uid: user.uid,
      email: user.email ?? '',
      name: '',
    );
  }
}
