import 'dart:async';

import 'package:blc_counter/data/Wishlist_item.dart';
import 'package:blc_counter/data/cart_item.dart';
import 'package:blc_counter/data/feature/home/model/home_product_data.dart';
import 'package:blc_counter/data/feature/wish_list/ui/wishlist.dart';
import 'package:blc_counter/data/grocery_products.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitalEvent>(homeInitalEvent);
    on<HomeProductWishlistButtonClickEvent>(
        homeProductWishlistButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
    on<HomeWishlistButtonNavigatorEvent>(homeWishlistButtonNavigatorEvent);
    on<HomeCartButtonNavigatorEvent>(homeCartButtonNavigatorEvent);
  }

  FutureOr<void> homeInitalEvent(
      HomeInitalEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        product: Grocery.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                imageUrl: e['image'],
                price: e['price']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    print("Wishlist clicked");
    wishItem.add(event.clockProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    print("cart List clicked");
    cartItems.add(event.clockProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigatorEvent(
      HomeWishlistButtonNavigatorEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigationToWishlistPageActionState());
    print("Wishlist navigated");
  }

  FutureOr<void> homeCartButtonNavigatorEvent(
      HomeCartButtonNavigatorEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigationToCartPageActionState());
    print("cart navigated");
  }
}
