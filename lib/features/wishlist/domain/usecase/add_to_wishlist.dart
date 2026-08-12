import '../repo/wishlist_repo.dart';
import '../entity/wishlist_item.dart';
import 'package:injectable/injectable.dart';


@injectable
class AddToWishlistUseCase {
  final WishlistRepository repository;

  AddToWishlistUseCase(this.repository);

  Future<void> call(WishlistItem item) {
    return repository.addToWishlist(item);
  }
}