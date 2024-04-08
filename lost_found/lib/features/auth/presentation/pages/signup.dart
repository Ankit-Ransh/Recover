import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/auth/presentation/pages/login.dart';
import 'package:lost_found/features/auth/presentation/widgets/divider.dart';
import 'package:lost_found/features/auth/presentation/widgets/forgot_password.dart';
import 'package:lost_found/features/auth/presentation/widgets/form_data_field.dart';
import 'package:lost_found/features/auth/presentation/widgets/login_button.dart';
import 'package:lost_found/features/auth/presentation/widgets/logo_box.dart';
import 'package:lost_found/features/auth/presentation/widgets/switch_login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppPallete.greyShade200,
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
          Text(
            "Welcome back you've been missed",
            style: TextStyle(
              color: AppPallete.greyShade600,
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
            onTap: () => {},
          ),
          const SizedBox(height: 25),
          const LoginOptionDivider(),
          const SizedBox(
            height: 25.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(imagePath: "lib/core/assets/images/google.png"),
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
  }
}
