import 'wishlist_state.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/wishlist_item.dart';
import '../../domain/usecase/get_wishlist.dart';  
import '../../domain/usecase/add_to_wishlist.dart';
import '../../domain/usecase/remove_from_wishlist.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  final GetWishlistUseCase getWishlistUseCase;
  final AddToWishlistUseCase addToWishlistUseCase;
  final RemoveFromWishlistUseCase removeFromWishlistUseCase;

  WishlistCubit(
    this.getWishlistUseCase,
    this.addToWishlistUseCase,
    this.removeFromWishlistUseCase,
  ) : super(const WishlistState.initial());

  Future<void> getWishlist() async {
    emit(const WishlistState.loading());

    try {
      final items = await getWishlistUseCase();

      emit(WishlistState.loaded(items));
    } catch (e) {
      emit(WishlistState.error(e.toString()));
    }
  }

  Future<void> addToWishlist(WishlistItem item) async {
    try {
      await addToWishlistUseCase(item);

      await getWishlist();
    } catch (e) {
      emit(WishlistState.error(e.toString()));
    }
  }

  Future<void> removeFromWishlist(String productId) async {
    try {
      await removeFromWishlistUseCase(productId);

      await getWishlist();
    } catch (e) {
      emit(WishlistState.error(e.toString()));
    }
  }
}