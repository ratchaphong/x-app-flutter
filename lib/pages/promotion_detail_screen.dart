import 'package:flutter/material.dart';
import 'package:x_app_flutter/models/promotion.dart';

class PromotionScreenArguments {
  final String categoryName;
  final Promotion promotion;

  PromotionScreenArguments(this.categoryName, this.promotion);
}

class PromotionDetailScreen extends StatelessWidget {
  final String categoryName;
  final Promotion promotion;

  const PromotionDetailScreen(
      {super.key, required this.categoryName, required this.promotion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(promotion.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            promotion.imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promotion.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 16),
                Text(
                  promotion.validity,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 16),
                Text(
                  promotion.description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
