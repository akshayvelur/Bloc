import 'package:blc_counter/data/feature/home/model/home_product_data.dart';
import 'package:blc_counter/data/feature/wish_list/bloc/wishlist_bloc.dart';
import 'package:blc_counter/data/feature/wish_list/ui/wish_list_Card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishInitialEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WhishList"),
          backgroundColor: Colors.teal,
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listenWhen: (previous, current) => current is WhishListEventAction,
          buildWhen: (previous, current) => current is! WhishListEventAction,
          listener: (context, state) {
            if (state is wishRemovelistAction) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("removed")));
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishSuccessState:
                final successState = state as WishSuccessState;
                print(successState.whisItems.length);
                return ListView.builder(
                  itemCount: successState.whisItems.length,
                  itemBuilder: (context, index) {
                    return WishTileWiget(
                      productDataModel: successState.whisItems[index],
                      wishListBloc: wishlistBloc,
                    );
                  },
                );
            }
            return Container();
          },
        ));
  }
}
