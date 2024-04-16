import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lost_found/features/auth/presentation/pages/login.dart';

class WelcomeBar extends StatelessWidget {
  const WelcomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user =
        (context.read<AppUserCubit>().state as AppUserLoggedIn).user.name;

    return Container(
      color: AppPallete.deepPurple,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello $user",
              style: const TextStyle(
                fontSize: 24.0,
                color: AppPallete.whiteColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<AuthBloc>().add(AuthSignOut());
                showSnackBar(context, "Logged Out Successfully");
                Navigator.pushAndRemoveUntil(
                    context, Login.route(), (route) => false);
              },
              child: const Icon(
                Icons.logout_outlined,
                size: 40.0,
                color: AppPallete.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
