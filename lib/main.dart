import 'package:flutter/material.dart';
import '/features/auth/presentation/view/sign_in_view.dart';
import 'features/auth/presentation/view/sign_up_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SignInView(),
        '/signUp': (context) => SignUpView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
