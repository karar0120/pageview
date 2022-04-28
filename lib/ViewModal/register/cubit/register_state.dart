// ignore_for_file: must_be_immutable, unnecessary_this

import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

class RegisterIntialState extends RegisterState {}

class RegisterChangeLock extends RegisterState {
  bool lock;
  RegisterChangeLock({required this.lock});
  @override
  List<Object> get props => [this.lock];
}

class RegisterSuccess extends RegisterState {
  bool checkRegister;
  RegisterSuccess({required this.checkRegister});
  @override
  List<Object> get props => [this.checkRegister];
}
