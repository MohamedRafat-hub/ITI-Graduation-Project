import '../../data/model/category_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<CategoryModel> categories;

  HomeSuccess(this.categories);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}