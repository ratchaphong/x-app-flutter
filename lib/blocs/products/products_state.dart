part of 'products_bloc.dart';

abstract class ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  ProductsLoaded({required this.products});
}

class ProductsError extends ProductsState {
  final String message;

  ProductsError({required this.message});
}
