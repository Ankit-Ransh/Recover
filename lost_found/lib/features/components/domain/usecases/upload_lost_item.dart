import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/core/usecase/usecase.dart';
import 'package:lost_found/features/components/domain/entities/lost_item.dart';
import 'package:lost_found/features/components/domain/repository/lost_item_repository.dart';

class UploadLostItem implements UseCase<LostItem, UploadLostItemParams> {
  final LostItemRepository lostItemRepository;

  UploadLostItem(this.lostItemRepository);

  @override
  Future<Either<Failure, LostItem>> call(UploadLostItemParams params) async {
    return await lostItemRepository.uploadLostItem(
      userId: params.userId,
      title: params.title,
      description: params.description,
      lostLocation: params.lostLocation,
      lostItemImage: params.lostItemImage,
      lostItemDate: params.lostItemDate,
      lostItemTime: params.lostItemTime,
      lostItemCategory: params.lostItemCategory,
      isItemFound: params.isItemFound,
    );
  }
}

class UploadLostItemParams {
  final String userId;
  final String title;
  final String description;
  final String lostLocation;
  final File lostItemImage;
  final String lostItemDate;
  final String lostItemTime;
  final String lostItemCategory;
  final bool isItemFound;

  UploadLostItemParams({
    required this.userId,
    required this.title,
    required this.description,
    required this.lostLocation,
    required this.lostItemImage,
    required this.lostItemDate,
    required this.lostItemTime,
    required this.lostItemCategory,
    required this.isItemFound,
  });
}
