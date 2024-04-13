class FoundItem {
  final String id;
  final DateTime updatedAt;
  final String userId;
  final String title;
  final String description;
  final String foundLocation;
  final String foundItemImageUrl;
  final String itemCollectionLocation;
  final String itemCategory;

  FoundItem({
    required this.id,
    required this.updatedAt,
    required this.userId,
    required this.title,
    required this.description,
    required this.foundLocation,
    required this.foundItemImageUrl,
    required this.itemCollectionLocation,
    required this.itemCategory,
  });
}