import 'package:dio/dio.dart';
import '../models/product_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<ProductModel>> searchProducts(String query);
  Future<List<ProductModel>> getProductsByCategory(String category);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio dio;

  SearchRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    final response = await dio.get(
      'https://dummyjson.com/products/search',
      queryParameters: {'q': query},
    );

    if (response.statusCode == 200) {
      final List productsJson = response.data['products'];
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await dio.get(
      'https://dummyjson.com/products/category/$category',
    );

    if (response.statusCode == 200) {
      final List productsJson = response.data['products'];
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load category products');
    }
  }
}