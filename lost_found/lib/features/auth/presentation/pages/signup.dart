import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lost_found/features/auth/presentation/pages/login.dart';
import 'package:lost_found/features/auth/presentation/widgets/divider.dart';
import 'package:lost_found/features/auth/presentation/widgets/forgot_password.dart';
import 'package:lost_found/features/auth/presentation/widgets/form_data_field.dart';
import 'package:lost_found/features/auth/presentation/widgets/login_button.dart';
import 'package:lost_found/features/auth/presentation/widgets/logo_box.dart';
import 'package:lost_found/features/auth/presentation/widgets/switch_login.dart';
import 'package:lost_found/features/main/pages/index_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: AppPallete.greyShade200,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            } else if (state is AuthSuccess) {
              showSnackBar(context, "Account created successfully!");
              Navigator.pushAndRemoveUntil(
                context,
                IndexPage.route(),
                (Route<dynamic> route) =>
                    false, // This condition prevents any routes from being retained.
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }

            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    "Ready to get started?",
                    style: TextStyle(
                      color: AppPallete.lightPurple,
                      fontSize: 16.0,
                    ),
                  ),
                  const Text(
                    "Let's create an account!",
                    style: TextStyle(
                      color: AppPallete.deepPurple,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 25),
                  FormDataFields(
                    controller: nameController,
                    hintText: "Name",
                  ),
                  const SizedBox(height: 10),
                  FormDataFields(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 10),
                  FormDataFields(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  const ForgotPassword(),
                  const SizedBox(height: 25),
                  LoginButton(
                    buttonCommand: "Sign Up",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthSignUp(
                                email: emailController.text.trim(),
                                name: nameController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  const LoginOptionDivider(),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LogoWidget(
                          imagePath: "lib/core/assets/images/google.png"),
                    ],
                  ),
                  const SizedBox(height: 25),
                  SwitchLogin(
                    text: "Already a member?",
                    direction: "Login!",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
