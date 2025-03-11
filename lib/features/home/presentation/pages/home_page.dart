import 'package:dummy_full_with_clean/features/home/presentation/manager/category_manager/category_state.dart';
import 'package:dummy_full_with_clean/features/home/presentation/pages/search_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../manager/category_manager/category_provider.dart';
import '../manager/product_manager/product_provider.dart';
import '../manager/product_manager/product_state.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productsNotifierProvider.notifier).getAllProducts();
      ref.read(categoryNotifierProvider.notifier).getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productsNotifierProvider);
    final productByCategoryState = ref.watch(categoryProductsNotifierProvider);
    final categoriesState = ref.watch(categoryNotifierProvider);

    void loadCategoryProducts(String category){
      ref.read(categoryProductsNotifierProvider.notifier).getProductsByCategory(category);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchProductPage()),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          categoriesState is CategoriesLoading
              ? CircularProgressIndicator()
              : categoriesState is CategoriesSuccess
              ? SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesState.categories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton(
                onPressed: () {
                  ref.read(categoryProductsNotifierProvider.notifier).reset();
                },

                child: Text("All Categories"),
              ),
            );
          }

          Category category = categoriesState.categories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: () {
                loadCategoryProducts(category.slug!);
              },

              child: Text(category.name!),
            ),
          );
        },
      ),
    )

        : categoriesState is CategoriesError
              ? Text(categoriesState.message)
              : ElevatedButton(
            onPressed: () {},
            child: Text("Load Categories"),
          ),

          const SizedBox(height: 20),

          if (productByCategoryState is CategoryProductsLoading ||
              state is ProductsLoading)
            CircularProgressIndicator()

          else if (productByCategoryState is CategoryProductsError)
            Text(productByCategoryState.message)
          else if (state is ProductsError)
              Text(state.message)

            else if (productByCategoryState is CategoryProductsSuccess ||
                  state is ProductsSuccess)
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: productByCategoryState is CategoryProductsSuccess
                        ? productByCategoryState.products.length
                        : state is ProductsSuccess
                        ? state.products.length
                        : 0,
                    itemBuilder: (context, index) {
                      Product product = productByCategoryState is CategoryProductsSuccess
                          ? productByCategoryState.products[index]
                          : state is ProductsSuccess
                          ? state.products[index]
                          : throw Exception("Unexpected state");

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(product.thumbnail!),
                              Text(product.title!,style: TextStyle(fontSize: 20,color: Colors.white),),
                              Text(product.price!.toString(),style: TextStyle(fontSize: 14,color: Colors.grey),),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )

              else
                ElevatedButton(
                  onPressed: () {
                    ref.read(productsNotifierProvider.notifier).getAllProducts();
                  },
                  child: Text("Load Products"),
                ),
        ],
      ),

    );
  }
}
