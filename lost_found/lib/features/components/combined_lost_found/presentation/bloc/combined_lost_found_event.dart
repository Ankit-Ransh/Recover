part of 'combined_lost_found_bloc.dart';

@immutable
sealed class CombinedLostFoundEvent {}

final class CombinedLostFoundUploadBloc extends CombinedLostFoundEvent {
  final String status;
  final String title;
  final String description;
  final String location;
  final File image;
  final String? lostDate;
  final String? lostTime;
  final String? collectionCenter;
  final String userId;
  final String category;
  final bool claimed;

  CombinedLostFoundUploadBloc({
    required this.status,
    required this.title,
    required this.description,
    required this.location,
    required this.image,
    required this.lostDate,
    required this.lostTime,
    required this.collectionCenter,
    required this.userId,
    required this.category,
    required this.claimed,
  });
}
