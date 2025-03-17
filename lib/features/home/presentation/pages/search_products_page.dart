import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/product.dart';
import '../manager/product_provider.dart';
import '../manager/product_manager/product_state.dart';

class SearchProductPage extends ConsumerStatefulWidget {
  const SearchProductPage({super.key});

  @override
  ConsumerState<SearchProductPage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<SearchProductPage> {


  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchProductsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10),
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            suffixIcon: Icon(Icons.done)
          ),
          onChanged:(value)=> ref.read(searchProductsNotifierProvider.notifier).searchProduct(value),
        ),
      ),
      body: Center(
        child: state is SearchProductsLoading
            ? CircularProgressIndicator()
            : state is SearchProductsSuccess
            ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
                        ),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
              Product product = state.products[index];
              return Card(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(product.thumbnail!),
                    Text(product.title!),
                    Text(product.price!.toString()),
                  ],
                ),
              );
                        },
                      ),
            )
            : state is SearchProductsError
            ? Text(state.message)
            : Text("Search Product",style: TextStyle(fontSize: 35),),
      ),
    );
  }
}
