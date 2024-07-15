part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WhishListEventAction extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishSuccessState extends WishlistState {
  final List<ProductDataModel> whisItems;

  WishSuccessState({required this.whisItems});
}

class wishRemovelistAction extends WhishListEventAction {}
