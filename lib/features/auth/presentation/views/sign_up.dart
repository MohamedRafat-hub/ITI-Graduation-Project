import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import 'package:graduation_project/core/router/routes_manager.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_state.dart';
import 'package:graduation_project/features/auth/presentation/widgets/login_row.dart';
import 'package:graduation_project/features/auth/presentation/widgets/name_field.dart';
import 'package:graduation_project/features/auth/presentation/widgets/or_divider.dart';
import 'package:graduation_project/features/auth/presentation/widgets/email_field.dart';
import 'package:graduation_project/features/auth/presentation/widgets/submit_button.dart';
import 'package:graduation_project/features/auth/presentation/widgets/password_field.dart';
import 'package:graduation_project/features/auth/presentation/widgets/gradient_header.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
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
                  title: 'Create account',
                  subtitle: 'Sign up to start finding the perfect gift',
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
                        NameField(controller: _nameController),
                        const SizedBox(height: AppSize.s16),
                        EmailField(controller: _emailController),
                        const SizedBox(height: AppSize.s16),
                        PasswordField(
                          controller: _passwordController,
                          obscure: _obscurePassword,
                          onToggleObscure: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                        ),
                        const SizedBox(height: AppSize.s16),
                        PasswordField(
                          controller: _confirmPasswordController,
                          obscure: _obscureConfirmPassword,
                          hintText: 'Confirm password',
                          onToggleObscure: () => setState(
                            () => _obscureConfirmPassword =
                                !_obscureConfirmPassword,
                          ),
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSize.s24),
                        SubmitButton(
  onPressed: _submit,
  label: 'Sign Up',
  isLoading: state.maybeWhen(
    loading: () => true,
    orElse: () => false,
  ),
),
                        const SizedBox(height: AppSize.s20),
                        const OrDivider(text: 'or continue with'),
                        const SizedBox(height: AppSize.s20),
                        const SizedBox(height: AppSize.s20),
                        LoginRow(
                          onTap: () =>
                              context.pushNamed(RoutesManager.loginName),
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
