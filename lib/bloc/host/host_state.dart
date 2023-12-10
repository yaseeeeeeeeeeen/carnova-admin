part of 'host_bloc.dart';

abstract class HostState {}

final class HostActionState extends HostState {}

final class HostInitial extends HostState {}

class LoadingState extends HostState {}

class HostApprovelFailedState extends HostState {}

class HostFetchAllHostsLoadingState extends HostState {}

class HostFetchAllHostsSuccessState extends HostState {
  List<HostModal> hostVerifiedData;
  List<HostModal> hostPendigData;
  HostFetchAllHostsSuccessState(
      {required this.hostPendigData, required this.hostVerifiedData});
}

class HostFetchAllHostsErrorState extends HostState {}