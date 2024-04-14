class ItemInformation {
  final String title;
  final String description;
  final String postedBy;
  final DateTime updatedAt;
  final bool claimed;
  final String status;
  final String imageUrl;
  final String location;
  final String id;
  final String userId;

  ItemInformation({
    required this.title,
    required this.description,
    required this.postedBy,
    required this.updatedAt,
    required this.claimed,
    required this.status,
    required this.imageUrl,
    required this.location,
    required this.id,
    required this.userId,
  });
}
