import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

abstract class AuthState  extends Equatable{
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState{}

class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState{
  final User user;

  AuthSuccess({required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class AuthError extends AuthState{
  final String  message;
  AuthError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
