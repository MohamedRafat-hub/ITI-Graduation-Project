import '../../data/models/product_model.dart';
import 'package:graduation_project/features/search/presentation/cubit/search_cubit.dart';
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ProductModel> products;
  SearchSuccess(this.products);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}