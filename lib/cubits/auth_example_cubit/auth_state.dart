part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => ['Initial'];
}

class AuthenticationLoading extends AuthState {
  @override
  List<Object> get props => ['Loading'];
}

class Authenticated extends AuthState {
  @override
  List<Object> get props => ['User found'];
}

class AuthenticationFailed extends AuthState {
  @override
  List<Object> get props => ['User not found'];
}

class InternalError extends AuthState {
  @override
  List<Object> get props => ['User not found'];
}
