import '../../data/model/category_model.dart';

abstract class HomeRepository {
  Future<List<CategoryModel>> getCategories();
}