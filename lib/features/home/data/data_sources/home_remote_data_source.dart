import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firestore;

  HomeRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await firestore.collection('categories').get();

    return snapshot.docs
        .map((doc) => CategoryModel.fromJson(
      doc.data(),
      doc.id,
    ))
        .toList();
  }
}