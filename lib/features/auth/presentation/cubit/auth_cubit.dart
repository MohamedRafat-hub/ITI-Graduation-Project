import 'auth_state.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/domain/usecases/login_usecase.dart';
import 'package:graduation_project/features/auth/domain/usecases/logout_usecase.dart';
import 'package:graduation_project/features/auth/domain/usecases/sign_up_use_case.dart';




@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final LogoutUseCase logoutUseCase;

  AuthCubit(
    this.loginUseCase,
    this.signUpUseCase,
    this.logoutUseCase,
  ) : super(const AuthState.initial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());

    try {
      final user = await loginUseCase(
        email: email,
        password: password,
      );

      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());

    try {
      final user = await signUpUseCase(
        email: email,
        password: password,
      );

      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(const AuthState.loading());

    try {
      await logoutUseCase();

      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}