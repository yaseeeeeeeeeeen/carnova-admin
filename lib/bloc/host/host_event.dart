// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'host_bloc.dart';

abstract class HostEvent {
}

class HostFetchDataEvent extends HostEvent {}

class HostAprovedClicked extends HostEvent {
  final String id;
  final int index;
  HostAprovedClicked({required this.index, required this.id});
}

class HostBlocClicked extends HostEvent {
  final String id;
  final int index;
  HostBlocClicked({required this.id, required this.index});
}
