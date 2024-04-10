part of 'lost_item_bloc.dart';

@immutable
sealed class LostItemEvent {}

final class LostItemReportStatus extends LostItemEvent {
  final String userId;
  final String title;
  final String description;
  final String lostLocation;
  final File lostItemImage;
  final String lostItemDate;
  final String lostItemTime;
  final String lostItemCategory;
  final bool isItemFound;

  LostItemReportStatus({
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
