import 'package:flutter/material.dart';
import 'package:x_app_flutter/models/category.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> categories;

  const CategoryScreen({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          return ListTile(
            leading: Image.asset(
              category.imageUrl,
              width: 50.0,
              height: 50.0,
            ),
            title: Text(
              category.name,
              style: TextStyle(fontSize: 18.0),
            ),
            onTap: () {
              // Navigate to the product list screen for this category
            },
          );
        },
      ),
    );
  }
}
