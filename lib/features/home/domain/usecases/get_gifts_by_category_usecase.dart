import 'package:injectable/injectable.dart';

import '../repo/gift_repository.dart';
import '../../data/model/gift_model.dart';

@injectable
class GetGiftsByCategoryUseCase {
  final GiftRepository repository;

  GetGiftsByCategoryUseCase(this.repository);

  Future<List<GiftModel>> call(String category) {
    return repository.getGiftsByCategory(category);
  }
}