import 'package:x_app_flutter/models/product.dart';

class ProductRepository {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Product 1',
      description: 'Description of Product 1',
      price: 100.0,
      imageUrl: 'https://via.placeholder.com/150',
      category: 'Category 1',
    ),
    Product(
      id: 2,
      name: 'Product 2',
      description: 'Description of Product 2',
      price: 200.0,
      imageUrl: 'https://via.placeholder.com/150',
      category: 'Category 1',
    ),
    Product(
      id: 3,
      name: 'Product 3',
      description: 'Description of Product 3',
      price: 300.0,
      imageUrl: 'https://via.placeholder.com/150',
      category: 'Category 2',
    ),
    Product(
      id: 4,
      name: 'Product 4',
      description: 'Description of Product 4',
      price: 400.0,
      imageUrl: 'https://via.placeholder.com/150',
      category: 'Category 2',
    ),
    Product(
      id: 5,
      name: 'Product 5',
      description: 'Description of Product 5',
      price: 500.0,
      imageUrl: 'https://via.placeholder.com/150',
      category: 'Category 3',
    ),
    Product(
      id: 6,
      name: 'Product 6',
      description: 'Description of Product 6',
      price: 600.0,
      imageUrl: 'https://via.placeholder.com/150',
      category: 'Category 3',
    ),
  ];

  List<Product> getProducts() {
    return _products;
  }

  List<Product> getProductsByCategory(String category) {
    return _products
            .where((product) => product.category == category)
            .toList()
            .isNotEmpty
        ? _products.where((product) => product.category == category).toList()
        : _products;
  }

  Product getProductById(int id) {
    return _products.firstWhere((product) => product.id == id);
  }
}
