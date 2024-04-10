class LostItem {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String lostLocation;
  final String lostItemImage;
  final String lostItemDate;
  final String lostItemTime;
  final String lostItemCategory;
  final bool isItemFound;
  final DateTime updatedAt;

  LostItem({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.lostLocation,
    required this.lostItemImage,
    required this.lostItemDate,
    required this.lostItemTime,
    required this.lostItemCategory,
    required this.isItemFound,
    required this.updatedAt,
  });
}
