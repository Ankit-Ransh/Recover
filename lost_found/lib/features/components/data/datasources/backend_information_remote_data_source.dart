import 'package:lost_found/core/error/exceptions.dart';
import 'package:lost_found/features/components/data/models/lost_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BackendInformationRemoteDataSource {
  Future<List<LostItemModel>> getLostItemInformation();
}

class BackendInformationRemoteDataSourceImpl
    implements BackendInformationRemoteDataSource {
  final SupabaseClient supabaseClient;

  BackendInformationRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<LostItemModel>> getLostItemInformation() async {
    try {
      final lostItemInformation =
          await supabaseClient.from('itemlost').select('*, profiles (name)');

      return lostItemInformation
          .map(
            (information) => LostItemModel.fromJson(information).copyWith(
              posterName: information['profiles']['name'],
            ),
          )
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
