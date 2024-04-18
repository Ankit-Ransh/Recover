import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/core/usecase/usecase.dart';
import 'package:lost_found/features/chats/domain/entities/chat.dart';
import 'package:lost_found/features/components/backend/domain/repository/backend_information_repository.dart';

class BackendUserChatInformation implements UseCase<List<Chat>, NoParams> {
  final BackendInformationRepository backendInformationRepository;

  BackendUserChatInformation(this.backendInformationRepository);

  @override
  Future<Either<Failure, List<Chat>>> call(NoParams params) async {
    return await backendInformationRepository.getUserChats();
  }
}
