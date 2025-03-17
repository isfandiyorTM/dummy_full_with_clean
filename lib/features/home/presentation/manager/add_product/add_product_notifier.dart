import 'package:dummy_full_with_clean/features/home/presentation/manager/add_product/add_product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/product_model.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/use_cases/product_usecase.dart';

class AddProductNotifier extends StateNotifier<AddProductState> {
  final ProductUseCase productUseCase;

  AddProductNotifier({required this.productUseCase}) : super(AddProductInitial());

  Future<void> addProduct(ProductModel productModel) async {
    try {
      state = AddProductLoading();
      final storedProduct = await productUseCase.addProduct(productModel: productModel);
      state = AddProductSuccess(storedProduct);
    } catch (e) {
      state = AddProductError(e.toString());
      print(e);
    }
  }

}
