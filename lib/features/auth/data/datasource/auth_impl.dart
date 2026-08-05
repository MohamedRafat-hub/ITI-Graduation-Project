import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/features/auth/data/datasource/auth_remote.dart';



@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
final FirebaseFirestore _firestore;

AuthRemoteDataSourceImpl(
  this._firebaseAuth,
  this._firestore,
);

  @override
  @override
Future<User> signUp({
  required String email,
  required String password,
  required String name,
}) async {
  final credential =
      await _firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  final user = credential.user!;

  await _firestore
      .collection('users')
      .doc(user.uid)
      .set({
    'uid': user.uid,
    'name': name,
    'email': email,
    'createdAt': FieldValue.serverTimestamp(),
  });

  return user;
}

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    final credential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user!;
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}