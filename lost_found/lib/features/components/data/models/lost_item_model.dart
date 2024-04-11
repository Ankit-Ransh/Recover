import 'package:lost_found/features/components/domain/entities/lost_item.dart';

class LostItemModel extends LostItem {
  LostItemModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.description,
    required super.lostLocation,
    required super.lostItemImageUrl,
    required super.lostItemDate,
    required super.lostItemTime,
    required super.lostItemCategory,
    required super.isItemFound,
    required super.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'title': title,
      'description': description,
      'lost_location': lostLocation,
      'lost_item_image': lostItemImageUrl,
      'lost_item_date': lostItemDate,
      'lost_item_time': lostItemTime,
      'lost_item_category': lostItemCategory,
      'is_item_found': isItemFound,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory LostItemModel.fromJson(Map<String, dynamic> map) {
    return LostItemModel(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      lostLocation: map['lost_location'] as String,
      lostItemImageUrl: map['lost_item_image'] as String,
      lostItemDate: map['lost_item_date'] as String,
      lostItemTime: map['lost_item_time'] as String,
      lostItemCategory: map['lost_item_category'] as String,
      isItemFound: map['is_item_found'] ?? false,
      updatedAt: map['updated_at'] == null
          ? DateTime.now()
          : DateTime.parse(map['updated_at'] as String),
    );
  }

  LostItemModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? lostLocation,
    String? lostItemImageUrl,
    String? lostItemDate,
    String? lostItemTime,
    String? lostItemCategory,
    bool? isItemFound,
    DateTime? updatedAt,
  }) {
    return LostItemModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      lostLocation: lostLocation ?? this.lostLocation,
      lostItemImageUrl: lostItemImageUrl ?? this.lostItemImageUrl,
      lostItemDate: lostItemDate ?? this.lostItemDate,
      lostItemTime: lostItemTime ?? this.lostItemTime,
      lostItemCategory: lostItemCategory ?? this.lostItemCategory,
      isItemFound: isItemFound ?? this.isItemFound,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
