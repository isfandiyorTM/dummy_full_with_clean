import 'package:dummy_full_with_clean/features/home/domain/entities/product.dart';

abstract class ProductRepository{
  Future<Product> getProduct({required int id});
  Future<List<Product>> getAllProduct();
  Future<List<Product>> searchProduct(String query);
  Future<List<Product>> getProductsByCategory(String category);
}