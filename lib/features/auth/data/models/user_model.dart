import '../../domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
  });

  factory UserModel.fromFirebase({
    required String uid,
    required String email,
    required String name,
  }) {
    return UserModel(
      uid: uid,
      email: email,
    );
  }

  Map<String, dynamic> toJson({
    required String name,
  }) {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}