import 'profile_remote.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entity/profile_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ProfileRemoteDataSourceImpl(
    this.firestore,
    this.auth,
  );


  @override
  Future<ProfileEntity> getProfile() async {

    final uid = auth.currentUser!.uid;

    final doc = await firestore
        .collection('users')
        .doc(uid)
        .get();


    final data = doc.data() ?? {};

    return ProfileEntity(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      image: data['image'] ?? '', uid: '',
    );
  }



  @override
  Future<void> updateProfile({
    required String name,
    String? image,
  }) async {

    final uid = auth.currentUser!.uid;

    await firestore
        .collection('users')
        .doc(uid)
        .update({
          'name': name,
          if(image != null)
            'image': image,
        });
  }
}