part of 'products_bloc.dart';

abstract class ProductsEvent {}

class LoadProducts extends ProductsEvent {}

class SearchProducts extends ProductsEvent {
  final String keyword;

  SearchProducts({required this.keyword});
}
