import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app_flutter/blocs/products/products_bloc.dart';
import 'package:x_app_flutter/blocs/promotions/promotions_bloc.dart';
import 'package:x_app_flutter/models/product.dart';
import 'package:x_app_flutter/pages/home_screen.dart';
import 'package:x_app_flutter/pages/product_detail_screen.dart';
import 'package:x_app_flutter/pages/product_screen.dart';
import 'package:x_app_flutter/pages/promotion_detail_id_screen.dart';
import 'package:x_app_flutter/pages/promotion_detail_screen.dart';
import 'package:x_app_flutter/pages/promotion_screen.dart';
import 'package:x_app_flutter/pages/splash_screen.dart';
import 'package:x_app_flutter/repositories/product_repository.dart';
import 'package:x_app_flutter/repositories/promotion_repository.dart';
import 'package:x_app_flutter/services/app_constants.dart';
import 'package:x_app_flutter/set_env.dart';

void main() async {
  await setupEnvironment(AppEnvironment.production);
  final productRepository = ProductRepository();
  final promotionRepository = PromotionRepository();

  runApp(MyApp(
    productRepository: productRepository,
    promotionRepository: promotionRepository,
  ));
}

class MyApp extends StatelessWidget {
  static late AppEnvironment appEnvironment;
  final ProductRepository productRepository;
  final PromotionRepository promotionRepository;

  MyApp({required this.productRepository, required this.promotionRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
          create: (context) =>
              ProductsBloc(productRepository: productRepository),
        ),
        BlocProvider<PromotionsBloc>(
          create: (context) =>
              PromotionsBloc(promotionRepository: promotionRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        onGenerateRoute: (settings) {
          if (settings.name == '/product_detail') {
            final product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            );
          }
          if (settings.name == '/promotion_detail') {
            final args = settings.arguments as PromotionScreenArguments;
            final categoryName = args.categoryName;
            final promotion = args.promotion;
            return MaterialPageRoute(
              builder: (context) => PromotionDetailScreen(
                  categoryName: categoryName, promotion: promotion),
            );
          }
          return null;
        },
        routes: {
          '/splash': (context) => SplashScreen(),
          '/': (context) => HomeScreen(),
          '/products': (context) => ProductScreen(),
          '/promotions': (context) => PromotionScreen(),
          '/promotion_detail_id': (context) => PromotionDetailIdScreen(),
          // '/product_detail': (context) => ProductDetailScreen(
          //       product: ModalRoute.of(context)!.settings.arguments as Product,
          //     ),
        },
      ),
    );
  }
}
