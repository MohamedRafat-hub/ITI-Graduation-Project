import '../repo/wishlist_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class RemoveFromWishlistUseCase {
  final WishlistRepository repository;

  RemoveFromWishlistUseCase(this.repository);

  Future<void> call(String productId) {
    return repository.removeFromWishlist(productId);
  }
}