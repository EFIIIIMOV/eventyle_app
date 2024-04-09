import 'package:eventyle_app/constants/theme/fonts.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/forgot_password.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/sign_in_up_button.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/sign_in_up_text_button.dart';
import 'package:provider/provider.dart';
import '../../../../constants/theme/colors.dart';
import '../../../../constants/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../viewmodel/sign_up_view_model.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignUpViewModel>();

    return Scaffold(
      backgroundColor: AppColors.viewBackgroundColor,
      appBar: const CustomAppBar(
        title: 'EVENTYLE',
        buttonIcon: null,
        onButtonPressed: null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('РЕГИСТРАЦИЯ', style: AppFonts.signTitleTextStyle),
            const SizedBox(height: 30),
            CustomTextField(
              controller: _loginController,
              hintText: "Логин",
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _passwordController,
              hintText: "Пароль",
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _passwordController,
              hintText: "Повторить пароль",
            ),
            const SizedBox(height: 30),
            SignInUpButton(
              onPressed: () => viewModel.onSignUpButtonPressed(context),
              text: "Зарегистрироваться",
            ),
            const SizedBox(height: 15),
            SignInUpTextButton(
              signQuestionTitle: 'Уже есть аккаунт?',
              signTitle: 'Вход',
              onTap: () => viewModel.onSignInTextButtonPressed(context),
            ),
          ],
        ),
      ),
    );
  }
}
