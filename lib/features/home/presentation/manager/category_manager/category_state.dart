import 'package:dummy_full_with_clean/features/home/domain/entities/category.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}


// States for list of products
class CategoriesInitial extends CategoryState {}

class CategoriesLoading extends CategoryState {}

class CategoriesSuccess extends CategoryState {
  final List<Category> categories;
  CategoriesSuccess(this.categories);

  @override
  List<Object?> get props => [categories];
}

class CategoriesError extends CategoryState {
  final String message;
  CategoriesError(this.message);

  @override
  List<Object?> get props => [message];
}


