import 'package:blc_counter/data/feature/cart/ui/cartpage.dart';
import 'package:blc_counter/data/feature/home/bloc/home_bloc.dart';
import 'package:blc_counter/data/feature/home/ui/product_tile_widget.dart';
import 'package:blc_counter/data/feature/wish_list/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitalEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigationToWishlistPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WishList(),
              ));
        } else if (state is HomeNavigationToCartPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("item carted")));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item Wishliste")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text("Tro Grocery"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigatorEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigatorEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body: ListView.builder(
                itemCount: successState.product.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    productDataModel: successState.product[index],
                    homeBloc: homeBloc,
                  );
                },
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
