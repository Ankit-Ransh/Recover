import 'package:lost_found/core/error/exceptions.dart';
import 'package:lost_found/features/chats/data/models/chat_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ChatRemoteDataSource {
  Future<ChatModel> uploadChats(ChatModel userChats);
  Stream<List<ChatModel>> streamChats();
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final SupabaseClient supabaseClient;

  ChatRemoteDataSourceImpl(this.supabaseClient);

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
  
  @override
  Stream<List<ChatModel>> streamChats() {
    return supabaseClient
        .from('messages')
        .stream(primaryKey: ['id'])  
        .order('updated_at', ascending: true).map((list) => list.map((map) => ChatModel.fromJson(map)).toList());
  }
}
