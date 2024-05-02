import 'package:eventyle_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/forgot_password.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/sign_in_up_button.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/sign_in_up_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/theme/colors.dart';
import '../../../../core/constants/theme/fonts.dart';
import '../../../../core/constants/widgets/app_bar_widget.dart';
import '../viewmodel/sign_in_view_model.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignInViewModel>();

    return Scaffold(
      backgroundColor: AppColors.viewBackgroundColor,
      appBar: const CustomAppBar(
        title: 'EVENTYLE',
        buttonIcon: null,
        onButtonPressed: null,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('АВТОРИЗАЦИЯ', style: AppFonts.signTitleTextStyle),
              const SizedBox(height: 30),
              CustomTextField(controller: _loginController, hintText: "Логин"),
              const SizedBox(height: 20),
              CustomTextField(
                  controller: _passwordController, hintText: "Пароль"),
              const SizedBox(height: 30),
              SignInUpButton(
                onPressed: () => viewModel.onSignInButtonPressed(
                  context: context,
                  email: _loginController.text,
                  password: _passwordController.text,
                ),
                text: "Вход",
              ),
              const SizedBox(height: 15),
              ForgotPassword(
                onPressed: () => viewModel.onForgotTextButtonPressed(context),
                buttonTitle: 'Забыли пароль?',
              ),
              const SizedBox(height: 15),
              SignInUpTextButton(
                signQuestionTitle: 'Ещё нет аккаунта?',
                signTitle: 'Регистрация',
                onTap: () => viewModel.onSignUpTextButtonPressed(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
