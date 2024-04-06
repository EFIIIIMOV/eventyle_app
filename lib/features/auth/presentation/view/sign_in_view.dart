import 'package:eventyle_app/constants/theme/fonts.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/forgot_password.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/sign_button.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/sign_in_up_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/theme/colors.dart';
import '../../../../constants/widgets/app_bar_widget.dart';
import '../viewmodel/sign_in_view_model.dart';
import '../widgets/sign_title.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewBackgroundColor,
      appBar: const CustomAppBar(title: 'EVENTYLE'),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SignTitle(signTitle: 'АВТОРИЗАЦИЯ'),
              const SizedBox(height: 30),
              CustomTextField(controller: _loginController, hintText: "Логин"),
              const SizedBox(height: 20),
              CustomTextField(
                  controller: _passwordController, hintText: "Пароль"),
              const SizedBox(height: 30),
              SignInButton(onPressed: () {}, text: "Вход"),
              const SizedBox(height: 15),
              ForgotPassword(onPressed: () {}),
              const SizedBox(height: 15),
              SignUpTextButton(
                signQuestionTitle: 'Ещё нет аккаунта?',
                signTitle: 'Регистрация',
                onTap: () => context
                    .read<SignInViewModel>()
                    .onSignTextButtonPressed(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
