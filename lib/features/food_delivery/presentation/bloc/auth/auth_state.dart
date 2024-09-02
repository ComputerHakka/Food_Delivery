part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState({this.user});

  final UserEntity? user;

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthorizedState extends AuthState {
  const AuthorizedState({super.user});
}

final class UnAuthorizedState extends AuthState {
  const UnAuthorizedState();
}

final class AuthError extends AuthState {
  const AuthError();
}
