// ignore_for_file: must_be_immutable, unnecessary_this

import 'package:equatable/equatable.dart';

abstract class RegisterStates extends Equatable {
  const RegisterStates();
  @override
  List<Object> get props => [];
}

class RegisterIntialState extends RegisterStates {}

class RegisterChangeLock extends RegisterStates {
  bool lock;
  RegisterChangeLock({required this.lock});
  @override
  List<Object> get props => [this.lock];
}

class RegisterSuccess extends RegisterStates {
  bool checkRegister;
  RegisterSuccess({required this.checkRegister});
  @override
  List<Object> get props => [this.checkRegister];
}

class RegisterLoading extends RegisterStates {
  bool checkRegister;
  RegisterLoading({required this.checkRegister});
  @override
  List<Object> get props => [this.checkRegister];
}

class RegisterFail extends RegisterStates {
  bool checkRegister;
  RegisterFail({required this.checkRegister});
  @override
  List<Object> get props => [this.checkRegister];
}
