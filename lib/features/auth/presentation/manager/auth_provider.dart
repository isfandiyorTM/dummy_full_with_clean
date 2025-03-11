import 'package:dio/dio.dart';
import 'package:dummy_full_with_clean/features/auth/data/data_sources/auth_remote_date_source.dart';
import 'package:dummy_full_with_clean/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/use_cases/sign_in_usecase.dart';
import 'auth_notifier.dart';
import 'auth_state.dart';

// Dio instance provider
final dioProvider = Provider<Dio>((ref)=>Dio());

// Remote data source provider
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref){
  return AuthRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

// Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref){
  return AuthRepositoryImpl(remoteDataSource: ref.watch(authRemoteDataSourceProvider));
});

// UseCase provider
final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.watch(authRepositoryProvider));
});

// AuthNotifier provider
final authNotifierProvider =
StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(signInUseCase: ref.watch(signInUseCaseProvider));
});
