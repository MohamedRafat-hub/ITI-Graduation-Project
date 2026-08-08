// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasource/auth_impl.dart' as _i762;
import '../../features/auth/data/datasource/auth_remote.dart' as _i25;
import '../../features/auth/data/repo/auth_impl.dart' as _i910;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/usecases/current_user_use_case.dart'
    as _i748;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/sign_up_use_case.dart' as _i1037;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/profile/data/data_source/profile_remote.dart' as _i344;
import '../../features/profile/data/data_source/profile_remote_impl.dart'
    as _i592;
import '../../features/profile/data/repo/profile_repo_impl.dart' as _i256;
import '../../features/profile/domain/repo/profile_repo.dart' as _i364;
import '../../features/profile/domain/usecases/get_profile_usecase.dart'
    as _i965;
import '../../features/profile/domain/usecases/update_profile_use_case.dart'
    as _i540;
import '../../features/profile/domain/usecases/update_profile_usecase.dart'
    as _i478;
import '../../features/profile/presentation/cubit/profile_cubit.dart' as _i36;
import 'njectable_module.dart' as _i813;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => injectableModule.firestore);
    gh.lazySingleton<_i25.AuthRemoteDataSource>(
      () => _i762.AuthRemoteDataSourceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i170.AuthRepository>(
      () => _i910.AuthRepositoryImpl(gh<_i25.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i344.ProfileRemoteDataSource>(
      () => _i592.ProfileRemoteDataSourceImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.lazySingleton<_i364.ProfileRepository>(
      () => _i256.ProfileRepositoryImpl(gh<_i344.ProfileRemoteDataSource>()),
    );
    gh.factory<_i748.CurrentUserUseCase>(
      () => _i748.CurrentUserUseCase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i1037.SignUpUseCase>(
      () => _i1037.SignUpUseCase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i965.GetProfileUseCase>(
      () => _i965.GetProfileUseCase(gh<_i364.ProfileRepository>()),
    );
    gh.factory<_i540.UpdateProfileUseCase>(
      () => _i540.UpdateProfileUseCase(gh<_i364.ProfileRepository>()),
    );
    gh.factory<_i478.UpdateProfileUseCase>(
      () => _i478.UpdateProfileUseCase(gh<_i364.ProfileRepository>()),
    );
    gh.factory<_i36.ProfileCubit>(
      () => _i36.ProfileCubit(
        gh<_i965.GetProfileUseCase>(),
        gh<_i540.UpdateProfileUseCase>(),
      ),
    );
    gh.factory<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        gh<_i188.LoginUseCase>(),
        gh<_i1037.SignUpUseCase>(),
        gh<_i48.LogoutUseCase>(),
      ),
    );
    return this;
  }
}

class _$InjectableModule extends _i813.InjectableModule {}
