import 'package:injectable/injectable.dart';

import '../../domain/repo/categories_repo.dart';
import '../data_sources/categories_remote_data_source.dart';
import '../model/category_model.dart';

@LazySingleton(as: CategoriesRepository)
class CategoryRepositoryImpl implements CategoriesRepository {
  final HomeRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CategoryModel>> getCategories() {
    return remoteDataSource.getCategories();
  }
}