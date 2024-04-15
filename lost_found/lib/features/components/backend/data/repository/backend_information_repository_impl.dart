import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/exceptions.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/features/components/backend/data/datasources/backend_information_remote_data_source.dart';
import 'package:lost_found/features/components/found/domain/entities/found_item.dart';
import 'package:lost_found/features/components/lost/domain/entities/lost_item.dart';
import 'package:lost_found/features/components/backend/domain/repository/backend_information_repository.dart';

class BackendInformationRepositoryImpl implements BackendInformationRepository {
  final BackendInformationRemoteDataSource backendInformationRemoteDataSource;

  BackendInformationRepositoryImpl(this.backendInformationRemoteDataSource);

  @override
  Future<Either<Failure, List<LostItem>>> getLostItemInformation() async {
    try {
      final lostItemInformation =
          await backendInformationRemoteDataSource.getLostItemInformation();

      return right(lostItemInformation);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<FoundItem>>> getFoundItemInformation() async {
    try {
      final foundItemInformation =
          await backendInformationRemoteDataSource.getFoundItemInformation();

      return right(foundItemInformation);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}