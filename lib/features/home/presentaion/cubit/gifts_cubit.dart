import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/gift_model.dart';

import '../../domain/usecases/get_gifts_by_category_usecase.dart';
import '../../domain/usecases/get_gifts_usecase.dart';
import 'gifts_state.dart';

@injectable
class GiftsCubit extends Cubit<GiftsState> {
  final GetGiftsUseCase getGiftsUseCase;
  final GetGiftsByCategoryUseCase getGiftsByCategoryUseCase;

  GiftsCubit(
      this.getGiftsUseCase,
      this.getGiftsByCategoryUseCase,
      ) : super(GiftsInitial());

  Future<void> getGifts() async {
    emit(GiftsLoading());

    try {
      final gifts = await getGiftsUseCase();

      emit(GiftsLoaded(gifts));
    } catch (e) {
      emit(
        GiftsError(
          e.toString(),
        ),
      );
    }
  }
  Future<void> getGiftsByCategory(
      String category,
      ) async {
    emit(GiftsLoading());

    try {
      final gifts =
      await getGiftsByCategoryUseCase(category);

      emit(
        GiftsLoaded(gifts),
      );
    } catch (e) {
      emit(
        GiftsError(e.toString()),
      );
    }
  }
}