import 'package:dummy_full_with_clean/features/home/domain/entities/category.dart';

class CategoryModel extends Category{
  CategoryModel({required super.slug, required super.name, required super.url});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      slug: json['slug'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown',
      url: json['url'] as String? ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
      'url': url,
    };
  }
}
