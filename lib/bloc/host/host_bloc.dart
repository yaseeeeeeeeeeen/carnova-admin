import 'dart:async';
import 'dart:convert';

import 'package:carnova_webapp/data/network/api_services.dart';
import 'package:carnova_webapp/data/sharedpreference/admin_token.dart';
import 'package:carnova_webapp/modal/host_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'host_event.dart';
part 'host_state.dart';

class HostBloc extends Bloc<HostEvent, HostState> {
  List<HostModal> pendingHost = [];
  List<HostModal> verifiedHost = [];
  HostBloc() : super(HostInitial()) {
    on<HostAprovedClicked>(hostAprovedClicked);
    on<HostFetchDataEvent>(hostFetchDataEvent);
  }

  FutureOr<void> hostAprovedClicked(
      HostAprovedClicked event, Emitter<HostState> emit) async {
    emit(LoadingState());
    String? token = Sharedpref.instance.getToken();
    if (token != null) {
      final response = await ApiService.instance.verifyHost(event.id, token);
      if (response.statusCode == 200) {
        pendingHost[event.index].isVerified = true;
        verifiedHost.add(pendingHost[event.index]);
        pendingHost.removeAt(event.index);
        emit(HostFetchAllHostsSuccessState(
            hostPendigData: pendingHost, hostVerifiedData: verifiedHost));
      } else {
        emit(HostApprovelFailedState(message: "Verification"));
      }
    } else {
      print("Token is Null");
    }
  }

  FutureOr<void> hostFetchDataEvent(
      HostFetchDataEvent event, Emitter<HostState> emit) async {
    try {
      final token = Sharedpref.instance.getToken();
      if (token == null) {
        emit(HostFetchAllHostsErrorState());
      }
      final response = await ApiService.instance.getAllHosts(token!);
      if (response.statusCode == 200) {
        final hostData = jsonDecode(response.body) as List;
        // print(hostData);
        final hostDetails = hostData.map((e) => HostModal.fromJson(e)).toList();
        pendingHost = hostDetails
            .where((element) => element.isVerified == false)
            .toList();
        verifiedHost =
            hostDetails.where((element) => element.isVerified == true).toList();

        emit(HostFetchAllHostsSuccessState(
            hostPendigData: pendingHost, hostVerifiedData: verifiedHost));
      } else {
        emit(HostFetchAllHostsErrorState());
      }
    } catch (e) {
      print('Error is $e');
    }
  }
}
