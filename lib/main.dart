import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/features/auth/presentation/view/sign_in_view.dart';
import 'features/auth/presentation/view/sign_up_view.dart';
import 'features/auth/presentation/viewmodel/sign_in_view_model.dart';
import 'features/auth/presentation/viewmodel/sign_up_view_model.dart'; // Убедитесь, что вы импортировали ваш ViewModel

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpViewModel(),
        )
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => SignInView(),
          '/signUp': (context) => SignUpView(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
