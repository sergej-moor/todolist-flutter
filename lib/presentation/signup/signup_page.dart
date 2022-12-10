import 'package:flutter/material.dart';
import 'package:todo/presentation/signup/widgets/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpForm(),
    );
  }
}
