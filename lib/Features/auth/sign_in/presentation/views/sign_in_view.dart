import 'package:flutter/material.dart';
import 'package:interview_app/Features/auth/sign_in/presentation/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: SignInViewBody());
  }
}
