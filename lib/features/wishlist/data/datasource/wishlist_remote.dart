import '../../domain/entity/wishlist_item.dart';

abstract class WishlistRemoteDataSource {
  Future<List<WishlistItem>> getWishlist();

  Future<void> addToWishlist(WishlistItem item);

  Future<void> removeFromWishlist(String productId);
}