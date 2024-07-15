import 'dart:async';

import 'package:blc_counter/data/Wishlist_item.dart';
import 'package:blc_counter/data/feature/home/model/home_product_data.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishInitialEvent>(wishInitialEvent);
    on<WishRemoveFromwishEvent>(wishRemoveFromwishEvent);
  }

  FutureOr<void> wishInitialEvent(
      WishInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishSuccessState(whisItems: wishItem));
    // print(wishItem.length);
  }

  FutureOr<void> wishRemoveFromwishEvent(
      WishRemoveFromwishEvent event, Emitter<WishlistState> emit) {
    wishItem.remove(event.productDataModel);
    emit(wishRemovelistAction());
    emit(WishSuccessState(whisItems: wishItem));
  }
}
