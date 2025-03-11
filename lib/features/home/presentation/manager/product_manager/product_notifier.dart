import 'package:dummy_full_with_clean/features/home/domain/use_cases/product_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductUseCase productUseCase;

  ProductNotifier({required this.productUseCase}) : super(ProductInitial());

  Future<void> getProduct(int id) async {
    try {
      state = ProductLoading();
      final product = await productUseCase.get(id: id);
      state = ProductSuccess(product);
    } catch (e) {
      state = ProductError(e.toString());
    }
  }

}

class ProductsNotifier extends StateNotifier<ProductState> {
  final ProductUseCase productUseCase;

  ProductsNotifier({required this.productUseCase}) : super(ProductInitial());

  Future<void> getAllProducts() async {
    try {
      state = ProductsLoading();
      final products = await productUseCase.getAll();
      state = ProductsSuccess(products);
    } catch (e) {
      state = ProductsError(e.toString());
    }
  }
}

class SearchProductsNotifier extends StateNotifier<ProductState> {
  final ProductUseCase productUseCase;

  SearchProductsNotifier({required this.productUseCase}) : super(ProductInitial());

  Future<void> searchProduct(String query) async {
    try {
      state = SearchProductsLoading();
      final products = await productUseCase.searchProduct(query);
      state = SearchProductsSuccess(products);
    } catch (e) {
      state = SearchProductsError(e.toString());
    }
  }
}

class CategoryProductsNotifier extends StateNotifier<ProductState> {
  final ProductUseCase productUseCase;

  CategoryProductsNotifier({required this.productUseCase}) : super(ProductInitial());

  Future<void> getProductsByCategory(String category) async {
    try {
      state = CategoryProductsLoading();
      final products = await productUseCase.getProductsByCategory(category);
      state = CategoryProductsSuccess(products);
    } catch (e) {
      state = CategoryProductsError(e.toString());
    }
  }
  Future<void> reset() async {
    try {
      state = ProductsLoading();
      final products = await productUseCase.getAll();
      state = ProductsSuccess(products);
    } catch (e) {
      state = ProductsError(e.toString());
    }
  }
}