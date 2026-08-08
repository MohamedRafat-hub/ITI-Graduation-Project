import '../../data/model/gift_model.dart';

abstract class GiftRepository {
  Future<List<GiftModel>> getGifts();
  Future<List<GiftModel>> getGiftsByCategory(String category);
}