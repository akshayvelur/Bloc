import 'dart:async';

import 'package:blc_counter/data/cart_item.dart';
import 'package:blc_counter/data/feature/home/model/home_product_data.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitaialEvent>(cartInitaialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitaialEvent(
      CartInitaialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(CartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartRemovelistAction());
    emit(CartSuccessState(CartItems: cartItems));
  }
}
