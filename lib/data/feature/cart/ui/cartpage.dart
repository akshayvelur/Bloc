import 'package:blc_counter/data/feature/cart/bloc/cart_bloc.dart';
import 'package:blc_counter/data/feature/cart/ui/cart_view_Tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitaialEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Cart Items"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          // TODO: implement listener
          if (state is CartRemovelistAction) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Product Removed")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.CartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWiget(
                      productDataModel: successState.CartItems[index],
                      cartBloc: cartBloc);
                },
              );
          }
          return Container();
        },
      ),
    );
  }
}
