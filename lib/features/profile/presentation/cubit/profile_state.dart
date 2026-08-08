import '../../domain/entity/profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.loaded(ProfileEntity profile) = _Loaded;

  const factory ProfileState.updated() = _Updated;

  const factory ProfileState.error(String message) = _Error;
}