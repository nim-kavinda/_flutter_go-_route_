import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/data/product.dart';
import 'package:my_flutter_app/models/product_model.dart';
import 'package:my_flutter_app/router/route_names.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList = ProductData().productsList;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Products",
        ),
      ),
      body: ListView.builder(
        itemCount: ProductList.length,
        itemBuilder: (context, index) {
          final Product product = ProductList[index];
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed(
                  RouteNamesClass.singaleProducts,
                  extra: product,
                );
              },
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text(product.title),
                trailing: Text(product.price.toString()),
                leading: Image.network(
                  product.imageUrl,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
