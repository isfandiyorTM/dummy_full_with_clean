
import 'package:dummy_full_with_clean/features/home/data/data_sources/category_remote_data_source.dart';
import 'package:dummy_full_with_clean/features/home/domain/entities/category.dart';
import 'package:dummy_full_with_clean/features/home/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository{
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getCategories() {
    return remoteDataSource.getCategories();
  }


}