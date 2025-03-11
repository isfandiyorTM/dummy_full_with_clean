import 'package:dummy_full_with_clean/features/home/presentation/manager/product_manager/product_notifier.dart';
import 'package:dummy_full_with_clean/features/home/presentation/manager/product_manager/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../../../data/data_sources/product_remote_data_source.dart';
import '../../../data/repositories/product_repository_impl.dart';
import '../../../domain/repositories/product_repository.dart';
import '../../../domain/use_cases/product_usecase.dart';

// Dio instance provider
final dioProvider = Provider<Dio>((ref) => Dio());

// Remote data source provider
final productRemoteDataSourceProvider = Provider<ProductRemoteDataSource>((ref) {
  return ProductRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

// Repository provider
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(
      remoteDataSource: ref.watch(productRemoteDataSourceProvider));
});

// UseCase provider
final productUseCaseProvider = Provider<ProductUseCase>((ref) {
  return ProductUseCase(ref.watch(productRepositoryProvider));
});

// Product provider
final productNotifierProvider =
StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  return ProductNotifier(productUseCase: ref.watch(productUseCaseProvider));
});

// Products provider
final productsNotifierProvider =
StateNotifierProvider<ProductsNotifier, ProductState>((ref) {
  return ProductsNotifier(productUseCase: ref.watch(productUseCaseProvider));
});

// Search provider
final searchProductsNotifierProvider =
StateNotifierProvider<SearchProductsNotifier, ProductState>((ref) {
  return SearchProductsNotifier(productUseCase: ref.watch(productUseCaseProvider));
});

// Category products provider
final categoryProductsNotifierProvider =
StateNotifierProvider<CategoryProductsNotifier, ProductState>((ref) {
  return CategoryProductsNotifier(productUseCase: ref.watch(productUseCaseProvider));
});
