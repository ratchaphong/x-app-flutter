import 'package:flutter/material.dart';
import 'package:x_app_flutter/models/product.dart';
import 'package:x_app_flutter/pages/product_detail_screen.dart';

class ProductScreenArguments {
  final String categoryName;
  final List<Product> products;

  ProductScreenArguments(this.categoryName, this.products);
}

class ProductListScreen extends StatefulWidget {
  final ProductScreenArguments args;

  const ProductListScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryName = widget.args.categoryName;
    final products = widget.args.products;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(categoryName),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(
              product.imageUrl,
              width: 50.0,
              height: 50.0,
            ),
            title: Text(product.name),
            subtitle: Text('${product.price} Baht'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
