
import 'package:cocktails/models/cart.dart';
import 'package:cocktails/models/product.dart';
import 'package:cocktails/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  final String productId;

  ItemPage({key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ProductDataProvider>(context).getElementById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
          style: GoogleFonts.marmelad(),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Hero(
              tag: data.imgUrl,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(fontSize: 26),
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          'Цена: ',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          '${data.price}',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          ' BYN',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                    Divider(),
                    Text(data.description),
                    SizedBox(height: 20),
                    Provider.of<CartDataProvider>(context)
                            .cartItems
                            .containsKey(productId)
                        ? Column(
                            children: <Widget>[
                              MaterialButton(
                                color: Colors.tealAccent,
                                child: Text('Перейти в корзину'),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CartPage(),
                                  ));
                                },
                              ),
                              Text(
                                'Товар уже добавлен в корзину',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.blueGrey),
                              )
                            ],
                          )
                        : MaterialButton(
                      color: Theme.of(context).primaryColor,
                            child: Text('Добавить в корзину'),
                            onPressed: () {
                              Provider.of<CartDataProvider>(context,
                                      listen: false)
                                  .addItem(
                                productId: data.id,
                                imgUrl: data.imgUrl,
                                title: data.title,
                                price: data.price,
                              );
                            },
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
