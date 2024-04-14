part of 'backend_information_bloc.dart';

@immutable
sealed class BackendInformationState {}

final class BackendInformationInitial extends BackendInformationState {}

final class BackendInformationLoading extends BackendInformationState {}

final class BackendInformationFailure extends BackendInformationState {
  final String message;
  BackendInformationFailure(this.message);
}

final class BackendInformationSuccess extends BackendInformationState {
  final List<LostItem> lostItem;
  BackendInformationSuccess(this.lostItem);
}
