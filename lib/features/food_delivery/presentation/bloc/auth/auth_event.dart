part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogInEvent extends AuthEvent {
  const LogInEvent();
}

class LogOutEvent extends AuthEvent {
  const LogOutEvent();
}

class CheckAuthEvent extends AuthEvent {
  const CheckAuthEvent();
}
