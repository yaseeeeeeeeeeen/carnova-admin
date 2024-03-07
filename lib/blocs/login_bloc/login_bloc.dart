import 'dart:async';
import 'dart:convert';
import 'package:carnova_webapp/data/network/api_service.dart';
import 'package:carnova_webapp/data/shared_preference/sharedprf.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonEvent>(loginAdmin);
  }

  FutureOr<void> loginAdmin(
      LoginButtonEvent event, Emitter<LoginState> emit) async {
    final data = event.data;
    print(data);
    try {
      final response = await ApiService.instance.login(data);
      print(response.body);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final token = body['token'];
        Sharedpref.instance.storeToken(token);
        emit(LoginAdminSuccessMessageState());
      } else if (response.statusCode == 404) {
        emit(LoginAdmimNotFoundState());
      } else if (response.statusCode == 401) {
        emit(LoginAdminWrongPasswordState());
      } else if (response.statusCode == 500) {
        emit(LoginAdminInternalErrorState());
      }
    } catch (e) {
      print('Error is $e');
    }
  }
}
