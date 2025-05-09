import 'package:api_handling/core/api/api_consumer.dart';
import 'package:api_handling/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  signIn() async {
    try {
      emit(SignInLoading());
      print("Sign In Loading");
      final response = await api.post("baseURL", data: {
        "email": signInEmail.text,
        "password": signInPassword.text,
      });
      emit(SignInSuccess());
      print("Signed In Successfully");
    } catch (error) {
      emit(SignInFailure(errorMessage: error.toString()));
      print("Sign In Failed");
      print(error.toString());
    }
  }
}
