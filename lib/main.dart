import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app_flutter/models/category.dart';
import 'package:x_app_flutter/models/product.dart';
import 'package:x_app_flutter/models/promotion.dart';
import 'package:x_app_flutter/pages/category_screen.dart';
import 'package:x_app_flutter/pages/home_screen.dart';
import 'package:x_app_flutter/pages/product_detail_screen.dart';
import 'package:x_app_flutter/pages/product_screen.dart';
import 'package:x_app_flutter/pages/promotion_detail_screen.dart';
import 'package:x_app_flutter/pages/repair_service_screen.dart';
import 'package:x_app_flutter/pages/service_screen.dart';
import 'package:x_app_flutter/pages/promotion_screen.dart';
import 'package:x_app_flutter/pages/splash_screen.dart';
import 'package:x_app_flutter/repository/home.dart';

import 'blocs/home/home_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final homeRepository = HomeRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(homeRepository),
        ),
        // BlocProvider<ServiceBloc>(
        //   create: (context) =>
        //       ServiceBloc(serviceRepository: serviceRepository),
        // ),
        // BlocProvider<PromotionBloc>(
        //   create: (context) =>
        //       PromotionBloc(promotionRepository: promotionRepository),
        // ),
      ],
      child: MaterialApp(
        title: 'Kaidee App',
        theme: ThemeData(
          backgroundColor: Color(0xFF3b5998),
          primaryColor: Colors.red[700],
          accentColor: Colors.grey[500],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: "/",
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => BlocProvider.value(
                value: BlocProvider.of<HomeBloc>(context),
                child: HomeScreen(),
              ),
          // '/category': (context) => CategoryScreen(
          //       categories: ModalRoute.of(context)!.settings.arguments
          //           as List<Category>,
          //     ),
          '/product': (context) => ProductListScreen(
                args: ModalRoute.of(context)!.settings.arguments
                    as ProductScreenArguments,
              ),
          '/product-detail': (context) => ProductDetailScreen(
                product: ModalRoute.of(context)!.settings.arguments as Product,
              ),
          '/promotion': (context) => PromotionScreen(
                promotions: ModalRoute.of(context)!.settings.arguments
                    as List<PromotionModel>,
              ),
          '/promotion-detail': (context) => PromotionDetailScreen(
                promotion: ModalRoute.of(context)!.settings.arguments
                    as PromotionModel,
              ),
          // '/service': (context) => ServiceScreen(),
          // '/repair_service': (context) => RepairServiceScreen(),
        },
      ),
    );
  }
}
