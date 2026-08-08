import '../../data/model/category_model.dart';

abstract class CategoriesRepository {
  Future<List<CategoryModel>> getCategories();
}