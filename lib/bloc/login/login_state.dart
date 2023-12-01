part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

class  LoadingState extends LoginState{}

class LoginSuccsessState extends LoginState{}

class LoginFailedState extends LoginState{}