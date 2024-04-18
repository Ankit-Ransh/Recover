import 'package:lost_found/core/error/exceptions.dart';
import 'package:lost_found/features/chats/data/models/chat_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ChatRemoteDataSource {
  Future<ChatModel> uploadChats(ChatModel userChats);
  Future<List<ChatModel>> getUserChats();
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final SupabaseClient supabaseClient;

  ChatRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<ChatModel>> getUserChats() async {
    try {
      final userChats = await supabaseClient.from('messages').select();

      return userChats
          .map((information) => ChatModel.fromJson(information).copyWith())
          .toList();
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ChatModel> uploadChats(ChatModel userChats) async {
    try {
      final chats = await supabaseClient
          .from('messages')
          .insert(userChats.toJson())
          .select();

      return ChatModel.fromJson(chats.first);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}