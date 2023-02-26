import 'dart:async';

import 'package:x_app_flutter/models/promotion.dart';

class PromotionRepository {
  Future<List<Promotion>> getPromotions() async {
    // Make an API call or query the database to fetch the promotions data
    // For the purpose of this example, return a static list of promotions
    return [
      Promotion(
        id: 1,
        name: 'Summer Sale',
        description: 'Enjoy up to 50% off on selected items',
        imageUrl: 'https://example.com/summer-sale.jpg',
        startDate: DateTime(2022, 6, 1),
        endDate: DateTime(2022, 6, 30),
        validity: 'Valid for online and in-store purchases',
        location: 'All stores in the US',
      ),
      Promotion(
        id: 2,
        name: 'Back to School',
        description: 'Get 20% off on school supplies',
        imageUrl: 'https://example.com/back-to-school.jpg',
        startDate: DateTime(2022, 8, 1),
        endDate: DateTime(2022, 8, 31),
        validity: 'Valid for online purchases only',
        location: 'US and Canada',
      ),
      Promotion(
        id: 3,
        name: 'Winter Clearance',
        description: 'Clear out inventory with up to 70% off',
        imageUrl: 'https://example.com/winter-clearance.jpg',
        startDate: DateTime(2022, 12, 1),
        endDate: DateTime(2022, 12, 31),
        validity: 'Valid for in-store purchases only',
        location: 'All stores in the US and Canada',
      ),
    ];
  }

  Future<Promotion> getPromotionById(String id) async {
    // Make an API call or query the database to fetch the promotion data
    // For the purpose of this example, return a static promotion object
    return Promotion(
      id: 1,
      name: 'Summer Sale',
      description: 'Enjoy up to 50% off on selected items',
      imageUrl: 'https://example.com/summer-sale.jpg',
      startDate: DateTime(2022, 6, 1),
      endDate: DateTime(2022, 6, 30),
      validity: 'Valid for online and in-store purchases',
      location: 'All stores in the US',
    );
  }
}
