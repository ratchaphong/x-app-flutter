import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app_flutter/models/product.dart';
import 'package:x_app_flutter/repositories/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productRepository;

  ProductsBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductsLoading()) {
    on<LoadProducts>(_mapLoadProductsToState);
    on<SearchProducts>(_mapFilterProductsByKeyword);
  }

  void _mapLoadProductsToState(
      LoadProducts event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    try {
      final products = await _productRepository.getProducts();
      emit(ProductsLoaded(products: products));
    } catch (e) {
      emit(ProductsError(message: 'Error loading products'));
    }
  }

  void _mapFilterProductsByKeyword(
      SearchProducts event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    try {
      final products = _productRepository.getProductsByCategory(event.keyword);
      emit(ProductsLoaded(products: products));
    } catch (e) {
      emit(ProductsError(message: 'Error loading products'));
    }
  }
}
