import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktails/models/cart.dart';
import 'package:cocktails/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final index;

  const CartItem({key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartDataProvider cartData = Provider.of<CartDataProvider>(context);
    return Container(
      child: ListTile(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemPage(
                  productId: cartData.cartItems.keys.toList()[index],
                ),
              ),
            );
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: CachedNetworkImage(
                imageUrl: cartData.cartItems.values.toList()[index].imgUrl,
                fit: BoxFit.cover),
          ),
        ),
        title: Text(cartData.cartItems.values.toList()[index].title),
        subtitle:
            Text('Цена: ${cartData.cartItems.values.toList()[index].price}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                Provider.of<CartDataProvider>(context, listen: false)
                    .updateItemsSubOne(cartData.cartItems.keys.toList()[index]);
              },
            ),
            Text(
                'x ${Provider.of<CartDataProvider>(context, listen: false).cartItems.values.toList()[index].number}'),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                Provider.of<CartDataProvider>(context, listen: false)
                    .updateItemsAddOne(cartData.cartItems.keys.toList()[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
