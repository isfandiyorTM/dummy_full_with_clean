import 'package:dummy_full_with_clean/features/home/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final Product product;
  ProductSuccess(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);

  @override
  List<Object?> get props => [message];
}

// States for list of products
class ProductsLoading extends ProductState {}

class ProductsSuccess extends ProductState {
  final List<Product> products;
  ProductsSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductsError extends ProductState {
  final String message;
  ProductsError(this.message);

  @override
  List<Object?> get props => [message];
}


// States for search products
class SearchProductsLoading extends ProductState {}

class SearchProductsSuccess extends ProductState {
  final List<Product> products;
  SearchProductsSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class SearchProductsError extends ProductState {
  final String message;
  SearchProductsError(this.message);

  @override
  List<Object?> get props => [message];
}

// States for category products
class CategoryProductsLoading extends ProductState {}

class CategoryProductsSuccess extends ProductState {
  final List<Product> products;
  CategoryProductsSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class CategoryProductsError extends ProductState {
  final String message;
  CategoryProductsError(this.message);

  @override
  List<Object?> get props => [message];
}