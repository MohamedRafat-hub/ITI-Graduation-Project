import '../datasources/search_remote_data_source.dart';
import '../models/product_model.dart';

class SearchRepo {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepo({required this.remoteDataSource});

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      return await remoteDataSource.searchProducts(query);
    } catch (e) {
      throw Exception('Search failed: ${e.toString()}');
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      return await remoteDataSource.getProductsByCategory(category);
    } catch (e) {
      throw Exception('Failed to fetch products: ${e.toString()}');
    }
  }
}