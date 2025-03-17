import 'package:dummy_full_with_clean/features/home/data/data_sources/product_remote_data_source.dart';
import 'package:dummy_full_with_clean/features/home/domain/entities/product.dart';
import 'package:dummy_full_with_clean/features/home/domain/repositories/product_repository.dart';

import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository{
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Product> getProduct({required int id}) {
    return remoteDataSource.getProduct(id: id);
  }

  @override
  Future<List<Product>> getAllProduct() {
    return remoteDataSource.getAllProduct();
  }

  @override
  Future<List<Product>> searchProduct(String query) {
    return remoteDataSource.searchProduct(query);
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) {
    return remoteDataSource.getProductsByCategory(category);
  }

  @override
  Future<ProductModel> addProduct({required ProductModel productModel}) {
    return remoteDataSource.addProduct(productModel: productModel);
  }


}