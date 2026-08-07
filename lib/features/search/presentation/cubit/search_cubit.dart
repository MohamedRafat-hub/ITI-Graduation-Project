import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/search_repo.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super(SearchInitial());

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    try {
      final products = await searchRepo.searchProducts(query);
      if (products.isEmpty) {
        emit(SearchSuccess([]));
      } else {
        emit(SearchSuccess(products));
      }
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  Future<void> searchByCategory(String category) async {
    emit(SearchLoading());
    try {
      final products = await searchRepo.getProductsByCategory(category);
      emit(SearchSuccess(products));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}