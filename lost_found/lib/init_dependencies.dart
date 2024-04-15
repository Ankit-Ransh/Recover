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
import 'package:lost_found/features/components/backend/data/datasources/backend_information_remote_data_source.dart';
import 'package:lost_found/features/components/backend/domain/usecases/backend_found_information.dart';
import 'package:lost_found/features/components/found/data/datasources/found_item_remote_data_source.dart';
import 'package:lost_found/features/components/lost/data/datasources/lost_item_remote_data_source.dart';
import 'package:lost_found/features/components/backend/data/repository/backend_information_repository_impl.dart';
import 'package:lost_found/features/components/found/data/respository/found_item_repository_impl.dart';
import 'package:lost_found/features/components/lost/data/respository/lost_item_repository_impl.dart';
import 'package:lost_found/features/components/backend/domain/repository/backend_information_repository.dart';
import 'package:lost_found/features/components/found/domain/repository/found_item_repository.dart';
import 'package:lost_found/features/components/lost/domain/repository/lost_item_repository.dart';
import 'package:lost_found/features/components/backend/domain/usecases/backend_lost_information.dart';
import 'package:lost_found/features/components/found/domain/usecases/upload_found_item.dart';
import 'package:lost_found/features/components/lost/domain/usecases/upload_lost_item.dart';
import 'package:lost_found/features/components/backend/presentation/bloc/backend_information_bloc.dart';
import 'package:lost_found/features/components/found/presentation/bloc/found_item_bloc.dart';
import 'package:lost_found/features/components/lost/presentation/bloc/lost_item_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _intitAuth();
  _initLostItem();
  _initFoundItem();
  _initBackendInformation();

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

void _initFoundItem() {
  serviceLocator.registerFactory<FoundItemRemoteDataSource>(
    () => FoundItemRemoteDataSourceImpl(serviceLocator()),
  );

  serviceLocator.registerFactory<FoundItemRepository>(
    () => FoundItemRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => UploadFoundItem(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => FoundItemBloc(serviceLocator()),
  );
}

void _initBackendInformation() {
  serviceLocator.registerFactory<BackendInformationRemoteDataSource>(
      () => BackendInformationRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerFactory<BackendInformationRepository>(
      () => BackendInformationRepositoryImpl(serviceLocator()));

  serviceLocator.registerFactory(
    () => BackendLostInformation(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => BackendFoundInformation(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => BackendInformationBloc(
      getLostItemInformation: serviceLocator(),
      getFoundItemInformation: serviceLocator(),
    ),
  );
}
