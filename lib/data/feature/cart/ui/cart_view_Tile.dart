import 'package:blc_counter/data/feature/cart/bloc/cart_bloc.dart';
import 'package:blc_counter/data/feature/home/model/home_product_data.dart';
import 'package:flutter/material.dart';

class CartTileWiget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWiget(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(productDataModel.imageUrl),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(productDataModel.description),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ " + productDataModel.price.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeProductWishlistButtonClickEvent(
                        //     clockProduct: productDataModel));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveFromCartEvent(
                            productDataModel: productDataModel));
                      },
                      icon: Icon(Icons.shopping_bag))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
