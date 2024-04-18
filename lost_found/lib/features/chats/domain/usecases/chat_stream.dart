// import 'package:fpdart/fpdart.dart';
// import 'package:lost_found/core/error/failures.dart';
// import 'package:lost_found/core/usecase/usecase.dart';
// import 'package:lost_found/features/chats/domain/entities/chat.dart';
// import 'package:lost_found/features/chats/domain/repository/chat_repository.dart';

// class ChatStreamUseCase implements UseCase<Chat, ChatParams> {
//   final ChatRepository chatRepository;
//   ChatStreamUseCase(this.chatRepository);

//   @override
//   Stream<List<Chat>> call(ChatParams params)  {
//     return chatRepository.streamChats();
//   }
// }

// class ChatParams {
//   final DateTime updatedAt;
//   final String content;
//   final String senderId;
//   final String recieverId;

//   ChatParams({
//     required this.updatedAt,
//     required this.content,
//     required this.senderId,
//     required this.recieverId,
//   });
// }
