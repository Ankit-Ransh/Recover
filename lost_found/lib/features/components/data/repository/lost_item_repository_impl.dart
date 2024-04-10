import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/exceptions.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/features/components/data/datasources/lost_item_remote_data_source.dart';
import 'package:lost_found/features/components/data/models/lost_item_model.dart';
import 'package:lost_found/features/components/domain/entities/lost_item.dart';
import 'package:lost_found/features/components/domain/repository/lost_item_repository.dart';
import 'package:uuid/uuid.dart';

class LostItemRepositoryImpl implements LostItemRepository {
  LostItemRemoteDataSource lostItemRemoteDataSource;

  LostItemRepositoryImpl(this.lostItemRemoteDataSource);

  @override
  Future<Either<Failure, LostItem>> uploadLostItem({
    required String userId,
    required String title,
    required String description,
    required String lostLocation,
    required File lostItemImage,
    required String lostItemDate,
    required String lostItemTime,
    required String lostItemCategory,
    required bool isItemFound,
  }) async {
    try {
      LostItemModel lostItemModel = LostItemModel(
        id: const Uuid().v1(),
        userId: userId,
        title: title,
        description: description,
        lostLocation: lostLocation,
        lostItemImage: "",
        lostItemDate: lostItemDate,
        lostItemTime: lostItemTime,
        lostItemCategory: lostItemCategory,
        isItemFound: isItemFound,
        updatedAt: DateTime.now(),
      );

      final lostItemImageUrl =
          await lostItemRemoteDataSource.uploadLostItemImage(
        lostItemImage: lostItemImage,
        lostItem: lostItemModel,
      );

      lostItemModel = lostItemModel.copyWith(
        lostItemImage: lostItemImageUrl,
      );

      final recorededLostItem =
          await lostItemRemoteDataSource.recordLostItem(lostItemModel);
      return right(recorededLostItem);
    } on ServerException catch (e) {
      throw left(Failure(e.message));
    }
  }
}
