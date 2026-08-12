import '../repo/wishlist_repo.dart';
import '../entity/wishlist_item.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetWishlistUseCase {
  final WishlistRepository repository;

  GetWishlistUseCase(this.repository);

  Future<List<WishlistItem>> call() {
    return repository.getWishlist();
  }
}