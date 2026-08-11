import 'wishlist_remote.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entity/wishlist_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


@LazySingleton(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl
    implements WishlistRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  WishlistRemoteDataSourceImpl(
    this.firestore,
    this.auth,
  );

  CollectionReference<Map<String, dynamic>> get _wishlistCollection {
    final uid = auth.currentUser!.uid;

    return firestore
        .collection('users')
        .doc(uid)
        .collection('wishlist');
  }

  @override
  Future<List<WishlistItem>> getWishlist() async {
    final snapshot = await _wishlistCollection.get();

    return snapshot.docs.map((doc) {
      final data = doc.data();

      return WishlistItem(
        id: doc.id,
        title: data['title'] ?? '',
        image: data['image'] ?? '',
        price: (data['price'] ?? 0).toDouble(),
      );
    }).toList();
  }

  @override
  Future<void> addToWishlist(WishlistItem item) async {
    await _wishlistCollection.doc(item.id).set({
      'title': item.title,
      'image': item.image,
      'price': item.price,
    });
  }

  @override
  Future<void> removeFromWishlist(String productId) async {
    await _wishlistCollection.doc(productId).delete();
  }
}