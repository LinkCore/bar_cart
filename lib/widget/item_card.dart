import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktails/models/cart.dart';
import 'package:cocktails/models/product.dart';
import 'package:cocktails/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: product.color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ItemPage(productId: product.id)),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: CachedNetworkImage(
                      imageUrl: product.imgUrl, fit: BoxFit.cover),
                ),
                Container(
                  child: Text(
                    '${product.title}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${product.price}'),
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Colors.black38,
                  ),
                  onPressed: () {
                    Provider.of<CartDataProvider>(context, listen: false)
                        .addItem(
                      productId: product.id,
                      price: product.price,
                      title: product.title,
                      imgUrl: product.imgUrl,
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
