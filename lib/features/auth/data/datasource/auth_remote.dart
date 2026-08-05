import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<User> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<User> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  User? getCurrentUser();
}