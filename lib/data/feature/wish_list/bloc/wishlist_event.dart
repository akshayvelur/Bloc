part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishInitialEvent extends WishlistEvent {}

class WishRemoveFromwishEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishRemoveFromwishEvent({required this.productDataModel});
}
