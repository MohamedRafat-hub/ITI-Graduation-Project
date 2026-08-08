
import '../../data/model/category_model.dart';
import '../repo/categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable

class GetCategories {
  final CategoriesRepository repository;

  GetCategories(this.repository);

  Future<List<CategoryModel>> call() async {
    return await repository.getCategories();
  }
}


