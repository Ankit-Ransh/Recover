import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/utils/generate_chat_id.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/features/chats/domain/entities/chat.dart';
import 'package:lost_found/features/chats/presentation/bloc/user_chats_bloc.dart';
import 'package:lost_found/features/main/pages/splash_page.dart';

class UserInteraction extends StatefulWidget {
  final String userId;
  final String recieverId;
  final String name;

  const UserInteraction({
    super.key,
    required this.userId,
    required this.recieverId,
    required this.name,
  });

  static MaterialPageRoute route(
    String userId,
    String recieverId,
    String name,
  ) {
    return MaterialPageRoute(
      builder: (context) => UserInteraction(
        userId: userId,
        recieverId: recieverId,
        name: name,
      ),
    );
  }

  @override
  State<UserInteraction> createState() => _UserInteractionState();
}

class _UserInteractionState extends State<UserInteraction> {
  String generatedId = "";
  List userMessages = [];
  List<ChatMessage> messages = [];

  @override
  void initState() {
    super.initState();

    generatedId = generateChatId(widget.userId, widget.recieverId);
    context.read<UserChatsBloc>().add(UserChatInformationBloc());
    BlocListener(
      listener: (context, state) => {
        if (state is UserChatInformationSuccess)
          {
            messages = _generateChatMessageList(state.chats),
          },
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, SplashPage.route());
          },
          child: const Icon(CupertinoIcons.back),
        ),
        title: Text(widget.name),
      ),
      body: BlocConsumer<UserChatsBloc, UserChatsState>(
        listener: (context, state) {
          if (state is UserChatsFailure) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is UserChatsLoading) {
            return const Loader();
          }
          if (state is UserChatInformationSuccess) {
            messages = _generateChatMessageList(state.chats);
          } else if (state is UserChatsSuccess) {
            _newChatMessage(state.chats);
          }

          return DashChat(
            inputOptions: const InputOptions(
              alwaysShowSend: true,
            ),
            messageOptions: const MessageOptions(
              showOtherUsersAvatar: true,
              showTime: true,
            ),
            currentUser: ChatUser(id: widget.userId),
            onSend: _sendMessage,
            messages: messages,
          );
        },
      ),
    );
  }

  void _newChatMessage(Chat chat) {
    if (chat.generatedId == generatedId) {
      ChatMessage newMessage = ChatMessage(
        text: chat.content,
        user: ChatUser(id: chat.senderId),
        createdAt: chat.updatedAt,
      );

      messages.insert(0, newMessage);
    }
  }

  List<ChatMessage> _generateChatMessageList(List<Chat> chats) {
    List<ChatMessage> chatList = chats
        .where((chat) => chat.generatedId == generatedId)
        .map<ChatMessage>((chat) {
      return ChatMessage(
        text: chat.content,
        user: ChatUser(id: chat.senderId),
        createdAt: chat.updatedAt,
      );
    }).toList();

    int length = chatList.length;
    List<ChatMessage> sortedList = [];
    for (int i = length - 1; i >= 0; --i) {
      sortedList.add(chatList[i]);
    }

    return sortedList;
  }

  Future<void> _sendMessage(ChatMessage chatMessage) async {
    context.read<UserChatsBloc>().add(
          UserChatMessagesBloc(
            updatedAt: DateTime.now(),
            content: chatMessage.text,
            senderId: widget.userId,
            recieverId: widget.recieverId,
          ),
        );
  }
}
