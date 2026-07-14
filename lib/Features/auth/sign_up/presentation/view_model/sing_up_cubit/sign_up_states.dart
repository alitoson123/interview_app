import 'package:interview_app/Features/auth/core/data/models/user_model.dart';

class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  final UserModel user;

  SignUpSuccessState({required this.user});
}

class SignUpErrorState extends SignUpStates {
  final String errMessage;

  SignUpErrorState({required this.errMessage});
}