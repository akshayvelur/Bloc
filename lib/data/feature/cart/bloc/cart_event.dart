part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitaialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;

  CartRemoveFromCartEvent({required this.productDataModel});
}
