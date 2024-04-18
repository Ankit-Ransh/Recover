import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/usecase/usecase.dart';
import 'package:lost_found/features/chats/domain/entities/chat.dart';
import 'package:lost_found/features/chats/domain/usecases/chat_information.dart';
import 'package:lost_found/features/chats/domain/usecases/chat_usecase.dart';

part 'user_chats_event.dart';
part 'user_chats_state.dart';

class UserChatsBloc extends Bloc<UserChatsEvent, UserChatsState> {
  final ChatUsecase _chatUsecase;
  final ChatInformation _chatInformation;

  UserChatsBloc({
    required ChatUsecase chatUsecase,
    required ChatInformation chatInformation,
  })  : _chatUsecase = chatUsecase,
        _chatInformation = chatInformation,
        super(UserChatsInitial()) {
    on<UserChatsEvent>((event, emit) => emit(UserChatsLoading()));
    on<UserChatMessagesBloc>(_userChatMessageUpload);
    on<UserChatInformationBloc>(_getUserChatMessage);
  }

  void _getUserChatMessage(
      UserChatInformationBloc event, Emitter<UserChatsState> emit) async {
    final res = await _chatInformation(NoParams());

    res.fold(
      (l) => emit(UserChatsFailure(l.message)),
      (r) => emit(UserChatInformationSuccess(r)),
    );
  }

  void _userChatMessageUpload(
      UserChatMessagesBloc event, Emitter<UserChatsState> emit) async {
    final res = await _chatUsecase(
      ChatParams(
        updatedAt: event.updatedAt,
        content: event.content,
        senderId: event.senderId,
        recieverId: event.recieverId,
      ),
    );

    res.fold(
      (l) => emit(UserChatsFailure(l.message)),
      (r) => emit(UserChatsSuccess()),
    );
  }
}
