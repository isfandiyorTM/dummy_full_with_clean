import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/product.dart';
import '../manager/product_manager/product_provider.dart';
import '../manager/product_manager/product_state.dart';
import '../widgets/product_widget.dart';

class GetSingleProductPage extends ConsumerStatefulWidget {
  const GetSingleProductPage({Key? key}) : super(key: key);

  @override
  ConsumerState<GetSingleProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<GetSingleProductPage> {
  final TextEditingController _idController = TextEditingController();

  void _fetchProduct() {
    final id = int.tryParse(_idController.text.trim());
    if (id != null && id > 0) {
      ref.read(productNotifierProvider.notifier).getProduct(id);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid product ID")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productNotifierProvider);
    final productsState = ref.watch(productsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Fetch Product")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _idController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Product ID",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _fetchProduct,
              child: const Text("Get Product"),
            ),
            const SizedBox(height: 20),
            if (productState is ProductLoading)
              const CircularProgressIndicator(),
            if (productState is ProductError)
              Text(productState.message,
                  style: const TextStyle(color: Colors.red)),
            if (productState is ProductSuccess)
              ProductWidget(product: productState.product),
          ],
        ),
      ),
    );
  }
}