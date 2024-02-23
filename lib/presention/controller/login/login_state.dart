abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoaded extends LoginState {
  final bool rememberMe;

  LoginLoaded(this.rememberMe);
}
