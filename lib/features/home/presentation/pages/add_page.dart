import 'package:dummy_full_with_clean/features/home/presentation/manager/add_product/add_product_state.dart';
import 'package:dummy_full_with_clean/features/home/presentation/manager/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product_model.dart';
import '../../domain/entities/product.dart';

class AddPage extends ConsumerStatefulWidget {
  const AddPage({super.key});

  @override
  ConsumerState<AddPage> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void addProduct() {
    Dimensions dimensions = Dimensions(width: 10, height: 10, depth: 10);
    Review review = Review(rating: 10,
        comment: 'comment',
        date: DateTime(2020),
        reviewerName: 'reviewerName',
        reviewerEmail: 'reviewerEmail');
    Meta meta = Meta(createdAt: DateTime(2020),
        updatedAt: DateTime(2020),
        barcode: '2312',
        qrCode: 'qr');

    ProductModel product = ProductModel(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        category: "category",
        price: 150,
        discountPercentage: 10,
        rating: 10,
        stock: 10,
        tags: [],
        brand: "brand",
        sku: 'sku',
        weight: 10,
        dimensions: dimensions,
        warrantyInformation: 'warrantyInformation',
        shippingInformation: 'shippingInformation',
        availabilityStatus: 'availabilityStatus',
        reviews: [review],
        returnPolicy: 'returnPolicy',
        minimumOrderQuantity: 10,
        meta: meta,
        thumbnail: 'thumbnail',
        images: []);
    ref.read(addProductNotifierProvider.notifier).addProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    final addProductState = ref.watch(addProductNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Add page")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: titleController,
                decoration: InputDecoration(hintText: "Title")),
            TextField(controller: descriptionController,
                decoration: InputDecoration(hintText: "Description")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              addProduct();
            }, child: Text("Add Product")),

            if(addProductState is AddProductLoading)
              Center(
                child: CircularProgressIndicator(),
              ),

            if(addProductState is AddProductSuccess)
              Text(addProductState.productModel.title!),

            if(addProductState is AddProductError)
              Text(addProductState.message),
          ],
        ),
      ),
    );
  }
}
