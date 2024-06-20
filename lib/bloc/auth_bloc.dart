import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    }
  }

  Stream<AuthState> _mapEmailChangedToState(String email) async* {
    yield AuthInitial(email: email, password: state.password);
    yield _validateForm();
  }

  Stream<AuthState> _mapPasswordChangedToState(String password) async* {
    yield AuthInitial(email: state.email, password: password);
    yield _validateForm();
  }

  AuthState _validateForm() {
    final String email = state.email;
    final String password = state.password;

    bool isEmailValid = email.endsWith('@gmail.com');
    bool isPasswordValid = password.isNotEmpty && password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (isEmailValid && isPasswordValid) {
      return FormValid();
    } else {
      return AuthInitial(email: email, password: password);
    }
  }
}
