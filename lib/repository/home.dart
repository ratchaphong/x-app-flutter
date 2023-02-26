import 'package:x_app_flutter/models/product.dart';
import 'package:x_app_flutter/models/promotion.dart';

class HomeRepository {
  final List<Product> _products = [
    Product(
      id: 'p1',
      name: 'Iphone 12 Pro Max',
      description: 'Occaecat sint fugiat reprehenderit laboris.',
      imageUrl: 'assets/images/product_1.jpg',
      price: 45000.0,
    ),
    Product(
      id: 'p2',
      name: 'Samsung Galaxy S21 Ultra',
      description:
          'Cillum consequat proident ullamco deserunt veniam est exercitation ut ipsum.',
      imageUrl: 'assets/images/product_2.jpg',
      price: 20000.0,
    ),
    Product(
      id: 'p3',
      name: 'Macbook Pro 2021',
      description: 'Excepteur enim elit esse occaecat.',
      imageUrl: 'assets/images/product_3.jpg',
      price: 70000.0,
    ),
  ];

  final List<PromotionModel> _promotions = [
    PromotionModel(
      id: '1',
      name: 'Flash Sale',
      description: 'Get up to 50% off on selected items',
      image: 'assets/images/promotion_1.jpg',
      startDate: DateTime(2022, 3, 1),
      endDate: DateTime(2022, 3, 7),
      validity: 'Valid until March 7, 2022',
      location: 'Bangkok',
      discount: 50,
      title: 'Flash Sale',
    ),
    PromotionModel(
      id: '2',
      name: 'New Arrivals',
      description: 'Check out our latest arrivals!',
      image: 'assets/images/promotion_2.jpg',
      startDate: DateTime(2022, 3, 8),
      endDate: DateTime(2022, 3, 14),
      validity: 'Valid until March 14, 2022',
      location: 'Chiang Mai',
      discount: 20,
      title: 'New Arrivals',
    ),
    PromotionModel(
      id: '3',
      name: 'Free Shipping',
      description: 'Get free shipping for orders over ฿1000',
      image: 'assets/images/promotion_3.jpg',
      startDate: DateTime(2022, 3, 15),
      endDate: DateTime(2022, 3, 21),
      validity: 'Valid until March 21, 2022',
      location: 'Phuket',
      discount: 5,
      title: 'Free Shipping',
    ),
    PromotionModel(
      id: '4',
      name: 'Deals of the day',
      description: 'Limited-time offer',
      image: 'assets/images/promotion_4.jpg',
      startDate: DateTime(2022, 3, 15),
      endDate: DateTime(2022, 3, 21),
      validity: 'Valid until March 21, 2022',
      location: 'Yara',
      discount: 5,
      title: 'Deals of the day',
    ),
  ];

  List<Product> getProducts() {
    return _products;
  }

  List<PromotionModel> getPromotions() {
    return _promotions;
  }

  // List<Product> getProductsByCategory(String category) {
  //   return _products.where((product) => product.category == category).toList();
  // }

  // List<Product> searchProducts(String keyword) {
  //   return _products
  //       .where((product) =>
  //           product.name.toLowerCase().contains(keyword.toLowerCase()))
  //       .toList();
  // }

  // Product getProductById(int id) {
  //   return _products.firstWhere((product) => product.id == id);
  // }
}
