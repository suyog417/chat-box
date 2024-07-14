

abstract class SignInState {}

class AuthInitialState extends SignInState{}
class AuthLoadingState extends SignInState {}
class AuthCodeSentState extends SignInState {}
class AuthCodeVerifiedState extends SignInState {}
class AuthLoggedInState extends SignInState {
  // final User firebaseUser;
  // AuthLoggedInState(this.firebaseUser);
}
class AuthLoggedOutState extends SignInState {}
class AuthErrorState extends SignInState {
  final String error;
  AuthErrorState(this.error);
}