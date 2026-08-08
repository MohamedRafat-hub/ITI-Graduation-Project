import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_categories.dart';
import 'home_state.dart';
import 'package:injectable/injectable.dart';

@injectable

class HomeCubit extends Cubit<HomeState> {
  final GetCategories getCategoriesUseCase;

  HomeCubit(this.getCategoriesUseCase) : super(HomeInitial());

  Future<void> getCategories() async {
    emit(HomeLoading());

    try {
      final categories = await getCategoriesUseCase();

      emit(HomeSuccess(categories));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}