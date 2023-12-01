import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carnova_webapp/data/network/api.dart';

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
    final response = await ApiService.instance.loginAdmin(event.data);
    if (response.statusCode == 200) {
      emit(LoginSuccsessState());
    } else {
      print("Something Wrong--------${response.bodyBytes.toString()}");
      emit(LoginFailedState());
    }
  }
}
