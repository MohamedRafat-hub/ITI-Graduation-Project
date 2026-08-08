import '../../data/model/category_model.dart';

abstract class CategoryState {}

class HomeInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;

  CategorySuccess(this.categories);
}

class HomeError extends CategoryState {
  final String message;

  HomeError(this.message);
}