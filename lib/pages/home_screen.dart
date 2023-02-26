import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app_flutter/blocs/products/products_bloc.dart';
import 'package:x_app_flutter/blocs/promotions/promotions_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(LoadProducts());
    context.read<PromotionsBloc>().add(LoadPromotions());

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoaded) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return ListTile(
                              title: Text(product.name),
                              subtitle: Text('\$${product.price}'),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/product_detail',
                                  arguments: product,
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/products');
                        },
                        child: Text('View All Products'),
                      ),
                    ],
                  );
                } else if (state is ProductsLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: Text('Error loading products.'),
                  );
                }
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<PromotionsBloc, PromotionsState>(
              builder: (context, state) {
                if (state is PromotionsLoaded) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.promotions.length,
                          itemBuilder: (context, index) {
                            final promotions = state.promotions[index];
                            return ListTile(
                              title: Text(promotions.name),
                              subtitle: Text(promotions.description),
                              onTap: () {
                                context
                                    .read<PromotionsBloc>()
                                    .add(LoadPromotion(id: promotions.id));
                                Navigator.pushNamed(
                                  context,
                                  '/promotion_detail_id',
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/promotions');
                        },
                        child: Text('View All Promotions'),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
