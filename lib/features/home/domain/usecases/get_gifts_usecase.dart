import 'package:injectable/injectable.dart';

import '../repo/gift_repository.dart';
import '../../data/model/gift_model.dart';

@injectable
class GetGiftsUseCase {
  final GiftRepository repository;

  GetGiftsUseCase(this.repository);

  Future<List<GiftModel>> call() {
    return repository.getGifts();
  }
}