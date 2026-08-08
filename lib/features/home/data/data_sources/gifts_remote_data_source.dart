import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/gift_model.dart';
import 'package:injectable/injectable.dart';

abstract class GiftsRemoteDataSource {
  Future<List<GiftModel>> getGifts();
  Future<List<GiftModel>> getGiftsByCategory(String category);
}

@LazySingleton(as: GiftsRemoteDataSource)
class GiftsRemoteDataSourceImpl implements GiftsRemoteDataSource {
  final FirebaseFirestore firestore;

  GiftsRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<GiftModel>> getGifts() async {
    final snapshot = await firestore.collection('gifts').get();

    return snapshot.docs
        .map((doc) => GiftModel.fromJson(
      doc.data(),
      doc.id,
    ))
        .toList();
  }

  @override
  Future<List<GiftModel>> getGiftsByCategory(String category) async {
    final snapshot = await firestore
        .collection('gifts')
        .where('category', isEqualTo: category)
        .get();

    return snapshot.docs
        .map((doc) => GiftModel.fromJson(
      doc.data(),
      doc.id,
    ))
        .toList();
  }
}