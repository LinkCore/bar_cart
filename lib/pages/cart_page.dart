import 'package:cocktails/models/cart.dart';
import 'package:cocktails/widget/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {



  const CartPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartDataProvider cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Корзина'),
        ),
        body: cartData.cartItems.isEmpty
            ? Card(
                elevation: 5,
                margin: const EdgeInsets.all(30),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text('Корзина пуста'),
                ),
              )
            : Column(
                children: <Widget>[

                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Стоимость: ' + cartData.totalAmount.toStringAsFixed(2),
                        style: TextStyle(fontSize: 20),
                      ),
                      MaterialButton(
                        onPressed: () {
                          cartData.clear();
                        },
                        color: Theme.of(context).primaryColor,
                        child: Text('Купить'),
                      ),
                    ],
                  ),

                  Divider(),

                  Expanded(child: CartItemList(key)),
                ],
              ));
  }
}
