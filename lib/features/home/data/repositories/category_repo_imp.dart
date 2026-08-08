import 'package:injectable/injectable.dart';

import '../../domain/repo/home_repo.dart';
import '../data_sources/categories_remote_data_source.dart';
import '../model/category_model.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CategoryModel>> getCategories() {
    return remoteDataSource.getCategories();
  }
}