import 'package:injectable/injectable.dart';
import '../../domain/repo/gift_repository.dart';
import '../data_sources/gifts_remote_data_source.dart';
import '../model/gift_model.dart';

@LazySingleton(as: GiftRepository)
class GiftRepositoryImpl implements GiftRepository {
  final GiftsRemoteDataSource remoteDataSource;

  GiftRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<GiftModel>> getGifts() {
    return remoteDataSource.getGifts();
  }

  @override
  Future<List<GiftModel>> getGiftsByCategory(String category) {
    return remoteDataSource.getGiftsByCategory(category);
  }
}