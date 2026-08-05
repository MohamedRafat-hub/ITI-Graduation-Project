import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import 'package:graduation_project/core/router/routes_manager.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_state.dart';
import 'package:graduation_project/features/auth/presentation/widgets/or_divider.dart';
import 'package:graduation_project/features/auth/presentation/widgets/email_field.dart';
import 'package:graduation_project/features/auth/presentation/widgets/sign_up_row.dart';
import 'package:graduation_project/features/auth/presentation/widgets/submit_button.dart';
import 'package:graduation_project/features/auth/presentation/widgets/password_field.dart';
import 'package:graduation_project/features/auth/presentation/widgets/gradient_header.dart';
import 'package:graduation_project/features/auth/presentation/widgets/forgot_password_link.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  void _continueWithGoogle() {
    // TODO: dispatch google sign-in cubit event
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
      authenticated: (user) {
        context.goNamed(RoutesManager.homeName);
      },
      error: (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      },
    );
  },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.background,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const GradientHeader(
                  title: 'Welcome back',
                  subtitle: 'Sign in to find the perfect gift',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p24,
                  ).copyWith(top: AppPadding.p24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        EmailField(controller: _emailController),
                        const SizedBox(height: AppSize.s16),
                        PasswordField(
                          controller: _passwordController,
                          obscure: _obscurePassword,
                          onToggleObscure: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                        ),
                        const SizedBox(height: AppSize.s8),
                        ForgotPasswordLink(onPressed: () {}),
                        const SizedBox(height: AppSize.s16),
                        SubmitButton(
  onPressed: _submit,
  isLoading: state.maybeWhen(
    loading: () => true,
    orElse: () => false,
  ),
),
                        const SizedBox(height: AppSize.s20),
                        const OrDivider(text: 'or continue with'),
                        const SizedBox(height: AppSize.s20),
                        SignUpRow(
  onTap: () => context.pushNamed(RoutesManager.signUpName),
),
                        const SizedBox(height: AppSize.s24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
