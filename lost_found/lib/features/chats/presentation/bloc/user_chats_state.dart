part of 'user_chats_bloc.dart';

@immutable
sealed class UserChatsState {}

final class UserChatsInitial extends UserChatsState {}

final class UserChatsLoading extends UserChatsState {}

final class UserChatsFailure extends UserChatsState {
  final String message;
  UserChatsFailure(this.message);
}

final class UserChatsSuccess extends UserChatsState {}


