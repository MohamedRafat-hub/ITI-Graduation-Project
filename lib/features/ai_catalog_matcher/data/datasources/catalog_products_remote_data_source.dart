import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:graduation_project/features/search/data/models/product_model.dart';

abstract class CatalogProductsRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

@LazySingleton(as: CatalogProductsRemoteDataSource)
class CatalogProductsRemoteDataSourceImpl
    implements CatalogProductsRemoteDataSource {
  final FirebaseFirestore firestore;

  CatalogProductsRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await firestore.collection('gifts').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();

      return ProductModel.fromJson({
        'id': doc.id,
        ...data,
      });
    }).toList();
  }
}