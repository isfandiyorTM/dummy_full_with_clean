import 'package:dio/dio.dart';
import 'package:dummy_full_with_clean/features/home/data/models/product_model.dart';

abstract class ProductRemoteDataSource{
  Future<ProductModel> getProduct({required int id});
  Future<List<ProductModel>> getAllProduct();
  Future<List<ProductModel>> searchProduct(String query);
  Future<List<ProductModel>> getProductsByCategory(String category);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource{
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProductModel> getProduct({required int id}) async{
    final response = await dio.get(
        'https://dummyjson.com/products/$id',
    );
    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get product');
    }
  }

  @override
  Future<List<ProductModel>> getAllProduct()async {
    final response = await dio.get(
      'https://dummyjson.com/products',
    );

    if (response.statusCode == 200) {
      List jsonData = response.data['products'];
      return jsonData.map((product)=>ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to get products');
    }
  }

  @override
  Future<List<ProductModel>> searchProduct(query) async {
    final response = await dio.get('https://dummyjson.com/products/search?q=$query');

    if (response.statusCode == 200) {
      List jsonData = response.data['products'];
      return jsonData.map((product)=>ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to get products');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async{
    final response = await dio.get('https://dummyjson.com/products/category/$category');

    if (response.statusCode == 200) {
      List jsonData = response.data['products'];
      return jsonData.map((product)=>ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to get products');
    }
  }


}
