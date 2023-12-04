import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:carnova_webapp/data/network/api.dart';
import 'package:carnova_webapp/data/sharedpreference/admin_token.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
  }

  FutureOr<void> loginButtonClickedEvent(
      LoginButtonClickedEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    final response = await ApiService.instance.login(event.data);
    if (response.statusCode == 200) {
      final body = response.body;
      final data = await jsonDecode(body);
      String token = data['token'];
      Sharedpref.instance.storeToken(token);
      emit(LoginSuccsessState());
    } else {
      print("Something Wrong--------${response.bodyBytes.toString()}");
      emit(LoginFailedState());
    }
  }
}
