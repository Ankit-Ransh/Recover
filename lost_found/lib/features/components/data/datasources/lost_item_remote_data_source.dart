import 'dart:io';

import 'package:lost_found/core/error/exceptions.dart';
import 'package:lost_found/features/components/data/models/lost_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class LostItemRemoteDataSource {
  Future<LostItemModel> recordLostItem(LostItemModel lostItem);
  Future<String> uploadLostItemImage({
    required File lostItemImage,
    required LostItemModel lostItem,
  });
}

class LostItemRemoteDataSourceImpl implements LostItemRemoteDataSource {
  final SupabaseClient supabaseClient;
  LostItemRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<LostItemModel> recordLostItem(LostItemModel lostItem) async {
    try {
      final lostItemData = await supabaseClient
          .from('item_status')
          .insert(lostItem.toJson())
          .select();

      return LostItemModel.fromJson(lostItemData.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadLostItemImage({
    required File lostItemImage,
    required LostItemModel lostItem,
  }) async {
    try {
      await supabaseClient.storage
          .from('lost_item_image')
          .upload(lostItem.id, lostItemImage);

      return supabaseClient.storage
          .from('lost_item_image')
          .getPublicUrl(lostItem.id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
