import 'package:lost_found/features/components/domain/entities/found_item.dart';

class FoundItemModel extends FoundItem {
  FoundItemModel({
    required super.id,
    required super.updatedAt,
    required super.userId,
    required super.title,
    required super.description,
    required super.foundLocation,
    required super.foundItemImageUrl,
    required super.itemCollectionLocation,
    required super.itemCategory,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'updated_at': updatedAt.toIso8601String(),
      'user_id': userId,
      'title': title,
      'description': description,
      'found_location': foundLocation,
      'found_item_image': foundItemImageUrl,
      'found_item_collection_location': itemCollectionLocation,
      'found_item_category': itemCategory,
    };
  }

  factory FoundItemModel.fromJson(Map<String, dynamic> map) {
    return FoundItemModel(
      id: map['id'] as String,
      updatedAt: map['updated_at'] == null
          ? DateTime.now()
          : DateTime.parse(map['updated_at'] as String),
      userId: map['user_id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      foundLocation: map['found_location'] as String,
      foundItemImageUrl: map['found_item_image'] as String,
      itemCollectionLocation: map['found_item_collection_location'] as String,
      itemCategory: map['found_item_category'] as String,
    );
  }

  FoundItemModel copyWith({
    String? id,
    DateTime? updatedAt,
    String? userId,
    String? title,
    String? description,
    String? foundLocation,
    String? foundItemImageUrl,
    String? itemCollectionLocation,
    String? itemCategory,
  }) {
    return FoundItemModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      foundLocation: foundLocation ?? this.foundLocation,
      foundItemImageUrl: foundItemImageUrl ?? this.foundItemImageUrl,
      itemCollectionLocation:
          itemCollectionLocation ?? this.itemCollectionLocation,
      itemCategory: itemCategory ?? this.itemCategory,
    );
  }
}