import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/features/components/domain/entities/found_item.dart';
import 'package:lost_found/features/components/domain/entities/lost_item.dart';

abstract interface class BackendInformationRepository {
  Future<Either<Failure, List<LostItem>>> getLostItemInformation();
  Future<Either<Failure, List<FoundItem>>> getFoundItemInformation();
}
