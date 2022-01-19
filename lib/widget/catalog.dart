import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktails/pages/catalog_page.dart';
import 'package:flutter/material.dart';

class CatalogListTile extends StatelessWidget {
  final imgUrl;

  CatalogListTile({key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemCatalog(
            imgUrl: imgUrl,
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: ClipOval(
              child: CachedNetworkImage(
            imageUrl: imgUrl,
            fit: BoxFit.cover,
            height: 60,
            width: 60,
          )),
          title: Text('Летний освежающий набор'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('09:00 - 00:00'),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Color(0xFF9294a6),
                  ),
                  Text('4.9'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
