import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/usecase/usecase.dart';
import 'package:lost_found/features/components/domain/entities/lost_item.dart';
import 'package:lost_found/features/components/domain/usecases/backend_information.dart';

part 'backend_information_event.dart';
part 'backend_information_state.dart';

class BackendInformationBloc
    extends Bloc<BackendInformationEvent, BackendInformationState> {
  final BackendLostInformation _getLostItemInformation;

  BackendInformationBloc({
    required BackendLostInformation getLostItemInformation,
  })  : _getLostItemInformation = getLostItemInformation,
        super(BackendInformationInitial()) {
    on<BackendInformationEvent>((event, emit) => BackendInformationLoading());
    on<BackendLostInformationBloc>(_onFetchLostBackendInformation);
  }

  void _onFetchLostBackendInformation(
    BackendLostInformationBloc event,
    Emitter<BackendInformationState> emit,
  ) async {
    final res = await _getLostItemInformation(NoParams());
    res.fold(
      (l) => emit(BackendInformationFailure(l.message)),
      (r) => emit(BackendInformationSuccess(r)),
    );
  }
}
