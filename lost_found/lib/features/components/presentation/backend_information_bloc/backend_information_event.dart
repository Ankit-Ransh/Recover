part of 'backend_information_bloc.dart';

@immutable
sealed class BackendInformationEvent {}

final class BackendLostInformationBloc extends BackendInformationEvent {}
