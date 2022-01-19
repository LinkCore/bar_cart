import 'dart:collection';
import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final String imgUrl;
  final num price;
  final Color color;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.imgUrl,
      required this.color,
      required this.price});
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: '0',
      title: 'Эгг Ног',
      description: 'Эгг ног вкусный рождественский и новогодний коктейль не зря заслужил такую популярность по всему миру: в нем идеально сбалансированы нежный сливочный вкус, умопомрачительный пряный аромат, слегка тягучая мягкая консистенция и простота приготовления.',
      price: 7.5,
      imgUrl: 'https://img.povar.ru/main/4b/c1/c1/7f/egg-nog-352103.jpg',
      color: Color(0xFFe8d2b9),
    ),
    Product(
      id: '1',
      title: 'Пина Колада',
      description: 'Пина Колада потрясающий коктейль, основными ингредиентами которого являются ананасовый сок и молоко кокоса. Добавьте немного белого рома и сладкого сиропа, почувствуйте тропический вкус в своём бокале!',
      price: 6.5,
      imgUrl: 'https://winestreet.ru/off-line/article/1725/1.jpg',
      color: Color(0xFFF2E8CC),
    ),
    Product(
      id: '2',
      title: 'Белый Русский',
      description: 'Очень вкусный кофейный коктейль с добавлением сливок. Белый русский относится к достаточно крепким алкогольным напиткам за счёт добавления прежде всего водки, а так же кофейного ликёра.',
      price: 6.0,
      imgUrl: 'https://img.postershop.me/4798/Products/1438444_1588865476.2339_original.jpg',
      color: Color(0xFFffe0b2),
    ),
    Product(
      id: '3',
      title: 'Голубая Лагуна',
      description: 'Это один из самых красивых алкогольных напитков в мире. Он представляет собой летний освежающий лонг дринк. Действительно, его оригинальный ярко-голубой цвет смотрится более чем неожиданно. Однако Голубая лагуна известна не только благодаря экзотическим внешним данным. Помимо этого, коктейль может также похвастаться необычным приятным вкусом.',
      price: 6.0,
      imgUrl: 'https://smak.ua/i/76/20/1/76201/fb695d9ce4713e469de4919265211e80-resize_crop_1Xquality_100Xallow_enlarge_0Xw_1200Xh_630.jpg',
      color: Color(0xFFbecfea),
    ),
    Product(
      id: '4',
      title: 'Лонг Айленд',
      description: 'Из лонг-дринков барная версия коктейля Лонг-Айленд, пожалуй, - моя самая любимая. Кисло-сладкий и максимально алкогольный, он имеет свой, хорошо узнаваемый, вкус и аромат.',
      price: 7.0,
      imgUrl: 'https://static.1000.menu/img/content-v2/f8/c1/26915/kokteil-long-ailend_1596003309_10_max.jpg',
      color: Color(0xFFf0bbb4),
    ),
    Product(
      id: '5',
      title: 'Секс На Пляже',
      description: 'Угощай компанию друзей коктейлем секс на пляже! Этот коктейль один из самых популярных коктейлей в Мире.',
      price: 6.5,
      imgUrl: 'http://the-legends.ru/uploads/Products/product_456/Sex_Beach.png',
      color: Color(0xFFfbc082),
    ),
    Product(
      id: '6',
      title: 'Кровавая Мэри',
      description: 'Коктейль Кровавая Мэри – это не просто водка, смешанная с томатным соком. Это яркий охлаждающий (из-за льда) и одновременно согревающий (из-за водки) коктейль, при этом в определенной степени острый и может капельку полезный (веточка сельдерея).',
      price: 5.5,
      imgUrl: 'https://www.gastronom.ru/binfiles/images/20171229/b54543d9.jpg',
      color: Color(0xFFff7a70),
    ),
    Product(
      id: '7',
      title: 'Манхеттен',
      description: 'Этот коктейль делают для знаменитостей! Почему бы и не попробовать?',
      price: 10.0,
      imgUrl: 'https://alkogol.news/v_2/html/pictures/old-gold-3.jpg',
      color: Color(0xFFfc8a68),
    ),
    Product(
      id: '8',
      title: 'Негрони',
      description: 'Классический алкогольный коктейль. Простота и гениальность! Негрони - коктейль, родившийся в Италии в 19 веке. Напиток традиционно считается мужским, так как получается очень крепким (примерно 30 градусов). Обладает тонким запоминающимся вкусом, а также красив на вид.',
      price: 5.0,
      imgUrl: 'https://barlist.ru/media/uploads/recipe/1608/negroni.jpg',
      color: Color(0xFFed8b61),
    ),
    Product(
      id: '9',
      title: 'Куба Либре',
      description: '"Куба Либре" - коктейль исторического значения, впервые приготовленный в 1900 году. Его вкус до сих пор любят многие гурманы, поэтому напиток до нашего времени пользуется популярностью.',
      price: 6.5,
      imgUrl: 'https://recipe-catalog.ru/wp-content/uploads/2019/01/cocktail-cuba-liber.jpg',
      color: Color(0xFFa1563f),
    ),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id) =>
      _items.singleWhere((value) => value.id == id);
}
