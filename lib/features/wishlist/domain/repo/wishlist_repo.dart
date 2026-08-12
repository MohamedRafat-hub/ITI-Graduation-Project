import '../entity/wishlist_item.dart';

abstract class WishlistRepository {
  Future<List<WishlistItem>> getWishlist();

  Future<void> addToWishlist(WishlistItem item);

  Future<void> removeFromWishlist(String productId);
}