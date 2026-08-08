import '../../data/model/gift_model.dart';

List<GiftModel> sortGifts(
    List<GiftModel> gifts,
    String selectedFilter,
    ) {
  final sortedGifts = List<GiftModel>.from(gifts);

  switch (selectedFilter) {
    case "\$ Low":
      sortedGifts.sort(
            (a, b) => a.price.compareTo(b.price),
      );
      break;

    case "\$ High":
      sortedGifts.sort(
            (a, b) => b.price.compareTo(a.price),
      );
      break;

    case "★ Rating":
      sortedGifts.sort(
            (a, b) => b.rating.compareTo(a.rating),
      );
      break;

    case "Popular":
    // Keep Firebase order
      break;
  }

  return sortedGifts;
}