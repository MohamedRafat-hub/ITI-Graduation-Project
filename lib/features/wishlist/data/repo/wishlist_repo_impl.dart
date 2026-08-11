import 'package:injectable/injectable.dart';
import '../datasource/wishlist_remote.dart';
import '../../domain/repo/wishlist_repo.dart';
import '../../domain/entity/wishlist_item.dart';


@LazySingleton(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource remote;

  WishlistRepositoryImpl(this.remote);

  @override
  Future<List<WishlistItem>> getWishlist() {
    return remote.getWishlist();
  }

  @override
  Future<void> addToWishlist(WishlistItem item) {
    return remote.addToWishlist(item);
  }

  @override
  Future<void> removeFromWishlist(String productId) {
    return remote.removeFromWishlist(productId);
  }
}