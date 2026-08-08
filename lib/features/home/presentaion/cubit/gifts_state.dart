import 'package:equatable/equatable.dart';

import '../../data/model/gift_model.dart';

abstract class GiftsState extends Equatable {
  const GiftsState();

  @override
  List<Object?> get props => [];
}

class GiftsInitial extends GiftsState {}

class GiftsLoading extends GiftsState {}

class GiftsLoaded extends GiftsState {
  final List<GiftModel> gifts;

  const GiftsLoaded(this.gifts);

  @override
  List<Object?> get props => [gifts];
}

class GiftsError extends GiftsState {
  final String message;

  const GiftsError(this.message);

  @override
  List<Object?> get props => [message];
}