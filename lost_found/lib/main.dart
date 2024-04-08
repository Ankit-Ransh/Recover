import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/secrets/supabase_secrets.dart';
import 'package:lost_found/features/auth/data/datasources/remote_data_source.dart';
import 'package:lost_found/features/auth/data/repository/auth_repository_impl.dart';
import 'package:lost_found/features/auth/domain/usecases/user_sign_up.dart';
import 'package:lost_found/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lost_found/features/auth/presentation/pages/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: SupaBaseSecrets.url,
    anonKey: SupaBaseSecrets.anonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImpl(
              AuthRemoteDataSourceImpl(
                supabase.client,
              ),
            ),
          ),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
