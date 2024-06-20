import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  final String email;
  final String password;

  const AuthState({this.email = '', this.password = ''});

  @override
  List<Object> get props => [email, password];
}

class AuthInitial extends AuthState {
  const AuthInitial({String email = '', String password = ''})
      : super(email: email, password: password);
}

class EmailInvalid extends AuthState {
  final String error;

  const EmailInvalid(this.error) : super();

  @override
  List<Object> get props => [error];
}

class PasswordInvalid extends AuthState {
  final String error;

  const PasswordInvalid(this.error) : super();

  @override
  List<Object> get props => [error];
}

class FormValid extends AuthState {
  const FormValid() : super();
}
