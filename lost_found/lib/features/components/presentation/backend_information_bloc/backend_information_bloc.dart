import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/usecase/usecase.dart';
import 'package:lost_found/features/components/domain/entities/found_item.dart';
import 'package:lost_found/features/components/domain/entities/lost_item.dart';
import 'package:lost_found/features/components/domain/usecases/backend_found_information.dart';
import 'package:lost_found/features/components/domain/usecases/backend_lost_information.dart';

part 'backend_information_event.dart';
part 'backend_information_state.dart';

class BackendInformationBloc
    extends Bloc<BackendInformationEvent, BackendInformationState> {
  final BackendLostInformation _getLostItemInformation;
  final BackendFoundInformation _getFoundItemInformation;

  BackendInformationBloc({
    required BackendLostInformation getLostItemInformation,
    required BackendFoundInformation getFoundItemInformation,
  })  : _getLostItemInformation = getLostItemInformation,
        _getFoundItemInformation = getFoundItemInformation,
        super(BackendInformationInitial()) {
    on<BackendInformationEvent>((event, emit) => BackendInformationLoading());
    on<BackendLostInformationBloc>(_onFetchLostBackendInformation);
    on<BackendFoundInformationBloc>(_onFetchFoundBackendInformation);
  }

  void _onFetchLostBackendInformation(
    BackendLostInformationBloc event,
    Emitter<BackendInformationState> emit,
  ) async {
    final res = await _getLostItemInformation(NoParams());
    res.fold(
      (l) => emit(BackendInformationFailure(l.message)),
      (r) => emit(BackendInformationLostSuccess(r)),
    );
  }

  void _onFetchFoundBackendInformation(BackendFoundInformationBloc event,
      Emitter<BackendInformationState> emit) async {
    final res = await _getFoundItemInformation(NoParams());
    res.fold(
      (l) => emit(BackendInformationFailure(l.message)),
      (r) => emit(BackendInformationFoundSuccess(r)),
    );
  }
}
