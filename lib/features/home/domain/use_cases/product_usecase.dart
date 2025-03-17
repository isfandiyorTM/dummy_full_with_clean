import 'package:dummy_full_with_clean/features/home/domain/repositories/product_repository.dart';
import '../../data/models/product_model.dart';
import '../entities/product.dart';

class ProductUseCase {
  final ProductRepository repository;

  ProductUseCase(this.repository);

  Future<Product> get({required int id}) {
    return repository.getProduct(id: id);
  }

  Future<List<Product>> getAll() {
    return repository.getAllProduct();
  }

  Future<List<Product>> searchProduct(String query) {
    return repository.searchProduct(query);
  }

  Future<List<Product>> getProductsByCategory(String category) {
    return repository.getProductsByCategory(category);
  }

  Future<ProductModel> addProduct({required ProductModel productModel}) {
    return repository.addProduct(productModel: productModel);
  }
}
