import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app_flutter/blocs/home/home_bloc.dart';
import 'package:x_app_flutter/models/promotion.dart';
import 'package:x_app_flutter/pages/product_screen.dart';

import '../models/product.dart';

List<PromotionModel> promotions = [
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

List<Product> products = [
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).backgroundColor,
          leading: Image.asset('assets/images/logo.png', height: 32.0),
          title: Text('Butcher'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: _buildBodyHomeScreen(context),
        // body: BlocBuilder<HomeBloc, HomeState>(
        //   builder: (contextBloc, state) {
        //     if (state is HomeInitial || state is HomeLoading) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else if (state is HomeLoaded) {
        //       return _buildBodyHomeScreen(context);
        //     } else {
        //       return Container();
        //     }
        //   },
        // ),
      ),
    );
  }

  Widget _buildBodyHomeScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 10),
          // _buildCategorySection(context),
          SizedBox(height: 20),
          _buildBannerSection(context),
          SizedBox(height: 20),
          _buildProductSection(context),
          SizedBox(height: 20),
          _buildPromotionSection(context),
          // SizedBox(height: 20),
          // _buildServiceSection(context),
          SizedBox(height: 20),
          _buildAdSection(context),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  // Widget _buildCategorySection(BuildContext context) {
  //   return Container(
  //     height: 100,
  //     child: ListView(
  //       scrollDirection: Axis.horizontal,
  //       children: [
  //         Container(
  //           width: 80,
  //           child: Column(
  //             children: [
  //               CircleAvatar(
  //                 radius: 30,
  //                 backgroundImage: AssetImage('assets/images/category_1.jpg'),
  //               ),
  //               SizedBox(height: 5),
  //               Text('Cars'),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           width: 80,
  //           child: Column(
  //             children: [
  //               CircleAvatar(
  //                 radius: 30,
  //                 backgroundImage: AssetImage('assets/images/category_2.jpg'),
  //               ),
  //               SizedBox(height: 5),
  //               Text('Property'),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           width: 80,
  //           child: Column(
  //             children: [
  //               CircleAvatar(
  //                 radius: 30,
  //                 backgroundImage: AssetImage('assets/images/category_3.jpg'),
  //               ),
  //               SizedBox(height: 5),
  //               Text('Mobiles'),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           width: 80,
  //           child: Column(
  //             children: [
  //               CircleAvatar(
  //                 radius: 30,
  //                 backgroundImage: AssetImage('assets/images/category_4.jpg'),
  //               ),
  //               SizedBox(height: 5),
  //               Text('Fashion'),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           width: 80,
  //           child: Column(
  //             children: [
  //               CircleAvatar(
  //                 radius: 30,
  //                 backgroundImage: AssetImage('assets/images/category_5.jpg'),
  //               ),
  //               SizedBox(height: 5),
  //               Text('Electronics'),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildBannerSection(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Image.asset(
        'assets/images/banner.jpeg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildPromotionSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Promotions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: promotions
                  .map(
                    (promotion) => _buildPromotionItem(
                      context,
                      promotion.image,
                      promotion.title,
                      promotion.description,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionItem(
      BuildContext context, String imageUrl, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 200,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/promotion',
            arguments: promotions,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: ProductScreenArguments('Meat', products),
                  );
                },
                child: Text(
                  'View all',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            // children: [
            children: products.map(
              (product) {
                return _buildProductItem(
                  context,
                  product.imageUrl,
                  product.name,
                  '${product.price} ฿',
                  () {
                    Navigator.pushNamed(
                      context,
                      '/product-detail',
                      arguments: product,
                    );
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, String imageUrl, String title,
      String price, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                price,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildServiceSection(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Services',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 20,
  //               ),
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 Navigator.of(context).pushNamed("/service");
  //               },
  //               child: Text(
  //                 'View all',
  //                 style: TextStyle(
  //                   color: Theme.of(context).primaryColor,
  //                   fontSize: 16,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 10),
  //         GridView.count(
  //           crossAxisCount: 3,
  //           mainAxisSpacing: 10,
  //           crossAxisSpacing: 10,
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           children: [
  //             _buildServiceItem(
  //               context,
  //               'assets/images/repair.jpg',
  //               'Repair',
  //               () {
  //                 Navigator.of(context).pushNamed("/repair_service");
  //               },
  //             ),
  //             _buildServiceItem(
  //               context,
  //               'assets/images/delivery.jpg',
  //               'Delivery',
  //               () {},
  //             ),
  //             _buildServiceItem(
  //               context,
  //               'assets/images/payment.jpg',
  //               'Payment',
  //               () {},
  //             ),
  //             _buildServiceItem(
  //               context,
  //               'assets/images/chat.jpg',
  //               'Chat',
  //               () {},
  //             ),
  //             _buildServiceItem(
  //               context,
  //               'assets/images/insurance.jpg',
  //               'Insurance',
  //               () {},
  //             ),
  //             _buildServiceItem(
  //               context,
  //               'assets/images/travel.jpg',
  //               'Travel',
  //               () {},
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildServiceItem(
  //   BuildContext context,
  //   String iconUrl,
  //   String title,
  //   void Function() onTap,
  // ) {
  //   return InkWell(
  //     onTap: onTap,
  //     child: Column(
  //       children: [
  //         Container(
  //           height: 60,
  //           width: 60,
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.grey.withOpacity(0.5),
  //                 spreadRadius: 2,
  //                 blurRadius: 7,
  //                 offset: Offset(0, 3),
  //               ),
  //             ],
  //           ),
  //           child: Center(
  //             child: Image.asset(
  //               iconUrl,
  //               height: 30,
  //               width: 30,
  //             ),
  //           ),
  //         ),
  //         SizedBox(height: 5),
  //         Text(
  //           title,
  //           style: TextStyle(
  //             fontSize: 14,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildAdSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ads',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildAdItem(context, 'assets/images/ad_1.jpg'),
                _buildAdItem(context, 'assets/images/ad_2.jpg'),
                _buildAdItem(context, 'assets/images/ad_3.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdItem(BuildContext context, String imagePath) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
