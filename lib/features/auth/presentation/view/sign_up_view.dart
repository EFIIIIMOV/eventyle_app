import 'package:eventyle_app/constants/theme/fonts.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/forgot_password.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/sign_button.dart';
import 'package:eventyle_app/features/auth/presentation/widgets/sign_up_text_button.dart';
import '../../../../constants/theme/colors.dart';
import '../../../../constants/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewBackgroundColor,
      appBar: const CustomAppBar(title: 'EVENTYLE'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "РЕГИСТРАЦИЯ",
              style: AppFonts.signTitleTextStyle,
            ),
            const SizedBox(height: 30),
            CustomTextField(controller: _loginController, hintText: "Логин"),
            const SizedBox(height: 20),
            CustomTextField(
                controller: _passwordController, hintText: "Пароль"),
            const SizedBox(height: 20),
            CustomTextField(
                controller: _passwordController, hintText: "Повторить пароль"),
            const SizedBox(height: 30),
            SignInButton(onPressed: () {}, text: "Зарегистрироваться"),
            const SizedBox(height: 15),
            SignUpTextButton(onPressed: () {Navigator.pushReplacementNamed(context, '/');}, signTitle: 'Вход', signQuestionTitle: 'Уже есть аккаунт?',),
          ],
        ),
      ),
    );
  }
}
