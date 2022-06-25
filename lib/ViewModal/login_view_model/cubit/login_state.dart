// ignore_for_file: must_be_immutable, unnecessary_this

part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginChangeLock extends LoginState {
  bool lock;
  LoginChangeLock({required this.lock});
  @override
  List<Object> get props => [this.lock];
}

class LoginLoading extends LoginState {
  bool checklogin;
  LoginLoading({required this.checklogin});
  @override
  List<Object> get props => [this.checklogin];
}

class LoginSuccess extends LoginState {
  bool checklogin;
  LoginSuccess({required this.checklogin});
  @override
  List<Object> get props => [this.checklogin];
}

class LoginFail extends LoginState {
  bool checklogin;
  LoginFail({required this.checklogin});
  @override
  List<Object> get props => [this.checklogin];
}
