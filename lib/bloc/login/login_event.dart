// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginButtonClickedEvent extends LoginEvent {
  Map<String, dynamic> data;
  LoginButtonClickedEvent({required this.data});
}
