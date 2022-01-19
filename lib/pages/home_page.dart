import 'package:cocktails/models/product.dart';
import 'package:cocktails/widget/bottom_bar.dart';
import 'package:cocktails/widget/catalog.dart';
import 'package:cocktails/widget/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height - 65,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Container(
                    child: ListTile(
                  title: Text('Горячительные напитки',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  subtitle: Text('Барная карта коктейлей',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  trailing: Icon(Icons.local_bar_sharp, size:(26)),
                )),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 290,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productData.items.length,
                      itemBuilder: (context, int index) =>
                          ChangeNotifierProvider.value(
                              value: productData.items[index],
                          child: ItemCard(),
                          )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Text('Каталог коктейлей'),
                ),

                ...productData.items.map((value){
                  return CatalogListTile(imgUrl: value.imgUrl,);
                }).toList(),
              ],
            )),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
