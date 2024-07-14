part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitalEvent extends HomeEvent {}

class HomeProductWishlistButtonClickEvent extends HomeEvent {
  final ProductDataModel clockProduct;

  HomeProductWishlistButtonClickEvent({required this.clockProduct});
}

class HomeProductCartButtonClickEvent extends HomeEvent {
  final ProductDataModel clockProduct;

  HomeProductCartButtonClickEvent({required this.clockProduct});
}

class HomeWishlistButtonNavigatorEvent extends HomeEvent {}

class HomeCartButtonNavigatorEvent extends HomeEvent {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
