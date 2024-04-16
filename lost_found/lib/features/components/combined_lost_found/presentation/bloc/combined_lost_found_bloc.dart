import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/usecases/combined_lost_found.dart';

part 'combined_lost_found_event.dart';
part 'combined_lost_found_state.dart';

class CombinedLostFoundBloc
    extends Bloc<CombinedLostFoundEvent, CombinedLostFoundState> {
  CombinedLostFoundUseCase combinedLostFoundUseCase;

  CombinedLostFoundBloc(this.combinedLostFoundUseCase)
      : super(CombinedLostFoundInitial()) {
    on<CombinedLostFoundEvent>(
        (event, emit) => emit(CombinedLostFoundLoading()));
    on<CombinedLostFoundUploadBloc>(_onCombinedLostFoundReport);
  }

  void _onCombinedLostFoundReport(CombinedLostFoundUploadBloc event,
      Emitter<CombinedLostFoundState> emit) async {
    final res = await combinedLostFoundUseCase(CombinedLostFoundParams(
      status: event.status,
      title: event.title,
      description: event.description,
      location: event.location,
      image: event.image,
      lostDate: event.lostDate,
      lostTime: event.lostTime,
      collectionCenter: event.collectionCenter,
      userId: event.userId,
      category: event.category,
      claimed: event.claimed,
    ));

    res.fold(
      (l) => emit(CombinedLostFoundFailure(l.message)),
      (r) => emit(CombinedLostFoundSuccess()),
    );
  }
}
