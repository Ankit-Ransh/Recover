import 'dart:io';

import 'package:lost_found/core/error/exceptions.dart';
import 'package:lost_found/features/components/combined_lost_found/data/models/combined_lost_found_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class CombinedLostFoundRemoteSource {
  Future<CombinedLostFoundModel> uploadCombinedLostFound(
      CombinedLostFoundModel combinedLostFoundModel);

  Future<void> claimedItem(String itemId, String userId);

  Future<String> uploadImage({
    required File image,
    required CombinedLostFoundModel combinedLostFoundItem,
  });
}

class CombinedLostFoundRemoteSourceImpl
    implements CombinedLostFoundRemoteSource {
  final SupabaseClient supabaseClient;
  CombinedLostFoundRemoteSourceImpl(this.supabaseClient);

  @override
  Future<void> claimedItem(String itemId, String userId) async {
    try {
      await supabaseClient
          .from('combined_database')
          .update({'claimed': true}).match(
        {
          'id': itemId,
          'user_id': userId,
        },
      );
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CombinedLostFoundModel> uploadCombinedLostFound(
      CombinedLostFoundModel combinedLostFoundModel) async {
    try {
      final combinedLostFoundData = await supabaseClient
          .from('combined_database')
          .insert(combinedLostFoundModel.toJson())
          .select();

      return CombinedLostFoundModel.fromJson(combinedLostFoundData.first);
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadImage({
    required File image,
    required CombinedLostFoundModel combinedLostFoundItem,
  }) async {
    try {
      await supabaseClient.storage
          .from('combined_database_storage')
          .upload(combinedLostFoundItem.id, image);

      return supabaseClient.storage
          .from('combined_database_storage')
          .getPublicUrl(combinedLostFoundItem.id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
