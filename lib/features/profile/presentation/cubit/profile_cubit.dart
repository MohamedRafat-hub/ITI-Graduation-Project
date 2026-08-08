import 'profile_state.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/update_profile_use_case.dart';
import 'package:graduation_project/features/profile/domain/usecases/get_profile_usecase.dart';



@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit(
    this.getProfileUseCase,
    this.updateProfileUseCase,
  ) : super(const ProfileState.initial());

  Future<void> getProfile() async {
    emit(const ProfileState.loading());

    try {
      final profile = await getProfileUseCase();

      emit(ProfileState.loaded(profile));
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  Future<void> updateProfile({
  required String name,
  String? image,
}) async {

  emit(const ProfileState.loading());

  try {

    await updateProfileUseCase(
      name: name,
      image: image,
    );

    emit(const ProfileState.updated());

  } catch(e){

    emit(ProfileState.error(e.toString()));

  }
}
  }
