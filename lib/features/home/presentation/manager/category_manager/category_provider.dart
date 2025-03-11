import 'package:dummy_full_with_clean/features/home/data/data_sources/category_remote_data_source.dart';
import 'package:dummy_full_with_clean/features/home/data/repositories/category_repository_impl.dart';
import 'package:dummy_full_with_clean/features/home/domain/repositories/category_repository.dart';
import 'package:dummy_full_with_clean/features/home/domain/use_cases/category_usecase.dart';
import 'package:dummy_full_with_clean/features/home/presentation/manager/category_manager/category_notifier.dart';
import 'package:dummy_full_with_clean/features/home/presentation/manager/product_manager/product_notifier.dart';
import 'package:dummy_full_with_clean/features/home/presentation/manager/product_manager/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../data/data_sources/product_remote_data_source.dart';
import '../../../data/repositories/product_repository_impl.dart';
import '../../../domain/repositories/product_repository.dart';
import '../../../domain/use_cases/product_usecase.dart';
import 'category_state.dart';

// Dio instance provider
final dioProvider = Provider<Dio>((ref) => Dio());

// Remote data source provider
final categoryRemoteDataSourceProvider = Provider<CategoryRemoteDataSource>((ref) {
  return CategoryRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

// Repository provider
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
return CategoryRepositoryImpl(
remoteDataSource: ref.watch(categoryRemoteDataSourceProvider));
});
// UseCase provider
final categoryUseCaseProvider = Provider<CategoryUseCase>((ref) {
  return CategoryUseCase(ref.watch(categoryRepositoryProvider));
});

// Category provider
final categoryNotifierProvider =
StateNotifierProvider<CategoriesNotifier, CategoryState>((ref) {
  return CategoriesNotifier(categoryUseCase: ref.watch(categoryUseCaseProvider));
});

