import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:x_app_flutter/models/product.dart';
import 'package:x_app_flutter/models/promotion.dart';
import 'package:x_app_flutter/repository/home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<LoadHome>((event, emit) => _mapLoadProductsToState());
  }

  Stream<HomeState> mapEventToState(HomeState event) async* {
    if (event is LoadHome) {
      yield* _mapLoadProductsToState();
    }
  }

  Stream<HomeState> _mapLoadProductsToState() async* {
    yield HomeLoading();
    try {
      final products = homeRepository.getProducts();
      final promotions = homeRepository.getPromotions();
      yield HomeLoaded(products: products, promotions: promotions);
    } catch (e) {
      yield HomeError(message: 'Error loading products');
    }
  }
}
