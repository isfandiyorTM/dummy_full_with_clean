import 'package:equatable/equatable.dart';

import '../../../data/models/product_model.dart';

abstract class AddProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductSuccess extends AddProductState {
  final ProductModel productModel;
  AddProductSuccess(this.productModel);

  @override
  List<Object?> get props => [productModel];
}

class AddProductError extends AddProductState {
  final String message;
  AddProductError(this.message);

  @override
  List<Object?> get props => [message];
}