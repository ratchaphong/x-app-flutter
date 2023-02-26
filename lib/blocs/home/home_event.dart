part of 'home_bloc.dart';

// Product events
abstract class HomeEvent {}

class LoadHome extends HomeEvent {}

// class FilterProductsByCategory extends HomeEvent {
//   final String category;

//   FilterProductsByCategory({required this.category});
// }

// class SearchProducts extends HomeEvent {
//   final String keyword;

//   SearchProducts({required this.keyword});
// }

// class GetProductById extends HomeEvent {
//   final int id;

//   GetProductById({required this.id});
// }
