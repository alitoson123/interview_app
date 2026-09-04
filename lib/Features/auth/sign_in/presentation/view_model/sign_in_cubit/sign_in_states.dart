import 'package:interview_app/Features/auth/core/data/models/user_model.dart';

class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {
  final UserModel user;

  SignInSuccessState({required this.user});
}

class SignInErrorState extends SignInStates {
  final String errMessage;

  SignInErrorState({required this.errMessage});
}

class SignInEmailNotVerifiedState extends SignInStates {}

class SignInVerificationEmailSentState extends SignInStates {}

