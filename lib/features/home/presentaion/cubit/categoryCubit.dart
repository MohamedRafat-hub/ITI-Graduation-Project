import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_categories.dart';
import 'category_state.dart';
import 'package:injectable/injectable.dart';

@injectable

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategories getCategoriesUseCase;

  CategoryCubit(this.getCategoriesUseCase) : super(HomeInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());

    try {
      final categories = await getCategoriesUseCase();

      emit(CategorySuccess(categories));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}