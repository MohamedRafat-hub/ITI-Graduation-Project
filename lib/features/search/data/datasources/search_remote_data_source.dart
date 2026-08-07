import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';
abstract class SearchRemoteDataSource {
  Future<List<ProductModel>> searchProducts(String query);
  Future<List<ProductModel>> getProductsByCategory(String category);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl();

  @override
  Future<List<ProductModel>> searchProducts(String query) async {

    final snapshot = await FirebaseFirestore.instance.collection('gifts').get();

    final allProducts = snapshot.docs.map((doc) {
      final data = doc.data();
      return ProductModel.fromJson({
        'id': doc.id,
        ...data,
      });
    }).toList();

    if (query.trim().isEmpty) {
      return allProducts;
    }

    return allProducts.where((product) {
      final title = product.title.toLowerCase();
      return title.contains(query.toLowerCase().trim());
    }).toList();
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {


    final snapshot = await FirebaseFirestore.instance
        .collection('gifts')
        .where('categoryId', isEqualTo: category)
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return ProductModel.fromJson({
        'id': doc.id,
        ...data,
      });
    }).toList();
  }
}