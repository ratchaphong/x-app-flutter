part of 'promotions_bloc.dart';

abstract class PromotionsState {}

class PromotionsLoading extends PromotionsState {}

class PromotionsLoaded extends PromotionsState {
  final List<Promotion> promotions;

  PromotionsLoaded({required this.promotions});
}

class PromotionLoaded extends PromotionsState {
  final Promotion promotion;

  PromotionLoaded({required this.promotion});
}

class PromotionsError extends PromotionsState {
  final String message;

  PromotionsError({required this.message});
}
