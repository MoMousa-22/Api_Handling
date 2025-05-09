abstract class UserState {}

class UserInitial extends UserState {}

class SignInSuccess extends UserState {}

class SignInLoading extends UserState {}

class SignInFailure extends UserState {
  final String errorMessage;

  SignInFailure({required this.errorMessage});
}
