import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>(
      (event, emit) async {
        final response = await _userSignUp(
          UserSignUpParams(
            name: event.name,
            email: event.email,
            password: event.password,
          ),
        );

        response.fold(
          (failure) => emit(AuthFailure(failure.message)),
          (uid) => emit(AuthSuccess(uid)),
        );
      },
    );
  }
}
