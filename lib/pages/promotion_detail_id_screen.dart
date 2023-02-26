import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app_flutter/blocs/promotions/promotions_bloc.dart';
import 'package:x_app_flutter/models/product.dart';

class PromotionDetailIdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromotionsBloc, PromotionsState>(
      builder: (context, state) {
        if (state is PromotionsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PromotionLoaded) {
          final promotion = state.promotion;
          return Scaffold(
            appBar: AppBar(
              title: Text(promotion.name),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  context.read<PromotionsBloc>().add(LoadPromotions());
                  Navigator.of(context).pop();
                },
              ),
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
        } else if (state is PromotionsError) {
          return Center(
            child: Text('Error loading promotions: ${state.message}'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
