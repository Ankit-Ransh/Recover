import 'package:lost_found/features/components/domain/entities/lost_item.dart';

class LostItemModel extends LostItem {
  LostItemModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.description,
    required super.lostLocation,
    required super.lostItemImage,
    required super.lostItemDate,
    required super.lostItemTime,
    required super.lostItemCategory,
    required super.isItemFound,
    required super.updatedAt,
  });

  LostItemModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? lostLocation,
    String? lostItemImage,
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
      lostItemImage: lostItemImage ?? this.lostItemImage,
      lostItemDate: lostItemDate ?? this.lostItemDate,
      lostItemTime: lostItemTime ?? this.lostItemTime,
      lostItemCategory: lostItemCategory ?? this.lostItemCategory,
      isItemFound: isItemFound ?? this.isItemFound,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'lostLocation': lostLocation,
      'lostItemImage': lostItemImage,
      'lostItemDate': lostItemDate,
      'lostItemTime': lostItemTime,
      'lostItemCategory': lostItemCategory,
      'isItemFound': isItemFound,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory LostItemModel.fromJson(Map<String, dynamic> map) {
    return LostItemModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      lostLocation: map['lostLocation'] as String,
      lostItemImage: map['lostItemImage'] as String,
      lostItemDate: map['lostItemDate'] as String,
      lostItemTime: map['lostItemTime'] as String,
      lostItemCategory: map['lostItemCategory'] as String,
      isItemFound: map['isItemFound'] as bool,
      updatedAt: map['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(map['updatedAt']),
    );
  }
}
