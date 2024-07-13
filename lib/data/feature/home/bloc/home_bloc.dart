import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishlistButtonClickEvent>(
        homeProductWishlistButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
    on<HomeWishlistButtonNavigatorEvent>(homeWishlistButtonNavigatorEvent);
    on<HomeCartButtonNavigatorEvent>(homeCartButtonNavigatorEvent);
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {}

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
