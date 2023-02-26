part of 'promotions_bloc.dart';

abstract class PromotionsEvent {}

class LoadPromotions extends PromotionsEvent {}

class LoadPromotion extends PromotionsEvent {
  final int id;

  LoadPromotion({required this.id});
}
