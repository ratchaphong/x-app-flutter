part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> products;
  final List<PromotionModel> promotions;
  HomeLoaded({required this.products, required this.promotions});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
