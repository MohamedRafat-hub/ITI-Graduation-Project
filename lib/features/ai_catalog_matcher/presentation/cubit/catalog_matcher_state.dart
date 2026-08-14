import 'package:equatable/equatable.dart';

import '../../domain/entities/catalog_match_entity.dart';

abstract class CatalogMatcherState extends Equatable {
  const CatalogMatcherState();

  @override
  List<Object?> get props => [];
}

class CatalogMatcherInitial extends CatalogMatcherState {}

class CatalogMatcherLoading extends CatalogMatcherState {}

class CatalogMatcherSuccess extends CatalogMatcherState {
  final List<CatalogMatchEntity> matches;

  const CatalogMatcherSuccess(this.matches);

  @override
  List<Object?> get props => [matches];
}

class CatalogMatcherError extends CatalogMatcherState {
  final String message;

  const CatalogMatcherError(this.message);

  @override
  List<Object?> get props => [message];
}