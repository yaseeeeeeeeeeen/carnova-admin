// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'host_bloc.dart';

abstract class HostState {
  final int index;

  HostState(this.index);
}

final class HostActionState extends HostState {
  HostActionState() : super(-1);
}

final class HostInitial extends HostState {
  HostInitial() : super(-1);
}

class LoadingState extends HostState {
  final int idx;
  LoadingState({required this.idx}) : super(idx);
}

class HostApprovelFailedState extends HostState {
  String message;
  HostApprovelFailedState({required this.message}) : super(-1);
}

class HostFetchAllHostsLoadingState extends HostState {
  HostFetchAllHostsLoadingState() : super(-1);
}

class HostFetchAllHostsSuccessState extends HostState {
  List<HostModal> hostVerifiedData;
  List<HostModal> hostPendigData;
  HostFetchAllHostsSuccessState(
      {required this.hostPendigData, required this.hostVerifiedData})
      : super(-1);
}

class HostFetchAllHostsErrorState extends HostState {
  HostFetchAllHostsErrorState() : super(-1);
}
