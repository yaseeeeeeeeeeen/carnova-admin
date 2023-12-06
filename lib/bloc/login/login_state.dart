// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class LoginSuccsessState extends LoginState {
  String token;
  LoginSuccsessState({
    required this.token
  });
}

class LoginFailedState extends LoginState {}
