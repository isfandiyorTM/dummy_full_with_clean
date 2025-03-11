import 'package:dummy_full_with_clean/features/home/domain/repositories/category_repository.dart';
import '../entities/category.dart';

class CategoryUseCase {
  final CategoryRepository repository;

  CategoryUseCase(this.repository);

  Future<List<Category>> getCategories(){
    return repository.getCategories();
  }

}