import 'package:get_it/get_it.dart';
import 'package:lost_found/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lost_found/core/secrets/supabase_secrets.dart';
import 'package:lost_found/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lost_found/features/auth/data/repository/auth_repository_impl.dart';
import 'package:lost_found/features/auth/domain/repository/auth_repository.dart';
import 'package:lost_found/features/auth/domain/usecases/current_user.dart';
import 'package:lost_found/features/auth/domain/usecases/user_login.dart';
import 'package:lost_found/features/auth/domain/usecases/user_sign_up.dart';
import 'package:lost_found/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lost_found/features/components/data/datasources/lost_item_remote_data_source.dart';
import 'package:lost_found/features/components/data/repository/lost_item_repository_impl.dart';
import 'package:lost_found/features/components/domain/repository/lost_item_repository.dart';
import 'package:lost_found/features/components/domain/usecases/upload_lost_item.dart';
import 'package:lost_found/features/components/presentation/bloc/lost_item_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _intitAuth();
  _initLostItem();

  final supabase = await Supabase.initialize(
    url: SupaBaseSecrets.url,
    anonKey: SupaBaseSecrets.anonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _intitAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSignUp(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserLogin(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => CurrentUser(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogin: serviceLocator(),
      currentUser: serviceLocator(),
      appUserCubit: serviceLocator(),
    ),
  );
}

void _initLostItem() {
  serviceLocator.registerFactory<LostItemRemoteDataSource>(
    () => LostItemRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<LostItemRepository>(
    () => LostItemRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UploadLostItem(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => LostItemBloc(
      serviceLocator(),
    ),
  );
}
