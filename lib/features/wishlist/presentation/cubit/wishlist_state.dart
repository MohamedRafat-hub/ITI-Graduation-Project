import '../../domain/entity/wishlist_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'wishlist_state.freezed.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = _Initial;

  const factory WishlistState.loading() = _Loading;

  const factory WishlistState.loaded(
    List<WishlistItem> items,
  ) = _Loaded;

  const factory WishlistState.error(
    String message,
  ) = _Error;
}