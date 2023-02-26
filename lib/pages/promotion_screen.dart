import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app_flutter/blocs/promotions/promotions_bloc.dart';
import 'package:x_app_flutter/pages/promotion_detail_screen.dart';

class PromotionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotion'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<PromotionsBloc, PromotionsState>(
              builder: (context, state) {
                if (state is PromotionsLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PromotionsLoaded) {
                  return ListView.builder(
                    itemCount: state.promotions.length,
                    itemBuilder: (context, index) {
                      final promotion = state.promotions[index];
                      return ListTile(
                        leading: Text(promotion.name),
                        title: Text(promotion.description),
                        subtitle: Text(promotion.validity),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/promotion_detail',
                            arguments: PromotionScreenArguments("", promotion),
                          );
                        },
                      );
                    },
                  );
                } else if (state is PromotionsError) {
                  return Center(
                    child: Text('Error loading promotions: ${state.message}'),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
