import 'package:eventyle_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/theme/colors.dart';
import '../../../../core/constants/widgets/app_bar_widget.dart';
import '../viewmodel/sign_up_user_info_view_model.dart';
import '../widgets/about_user_text_field.dart';
import '../widgets/dropdown_specialization_list.dart';
import '../widgets/sign_in_up_button.dart';
import '../widgets/sign_up_user_image.dart';

class SignUpUserInfoView extends StatefulWidget {
  const SignUpUserInfoView({super.key});

  @override
  State<SignUpUserInfoView> createState() => _SignUpUserInfoViewState();
}

class _SignUpUserInfoViewState extends State<SignUpUserInfoView> {
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _aboutController;
  Map<String, dynamic>? args;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _aboutController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewBackgroundColor,
      appBar: const CustomAppBar(
        title: 'EVENTYLE',
        buttonIcon: null,
        onButtonPressed: null,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<SignUpUserInfoViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignUpUserImage(
                    selectedImage: viewModel.profileSelectedImage,
                    onTap: () => viewModel.updateImageField(),
                  ),
                  SizedBox(height: 20),
                  DropDownSpecializationList(
                    profileSpecialization: viewModel.profileSpecialization,
                    profileSpecializations: viewModel.profileSpecializations,
                    onChanged: viewModel.updateProfileSpecialization,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: _nameController,
                    hintText: 'Имя',
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: _surnameController,
                    hintText: 'Фамилия',
                  ),
                  SizedBox(height: 20),
                  AboutUserTextField(
                    aboutController: _aboutController,
                  ),
                  SizedBox(height: 30),
                  SignInUpButton(
                    onPressed: () => viewModel.onRegNewUserButtonPressed(
                      context: context,
                      email: args?['email'],
                      password: args?['password'],
                      name: _nameController.text,
                      surname: _surnameController.text,
                      aboutUser: _aboutController.text,
                    ),
                    text: 'РЕГИСТРАЦИЯ',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
