import 'package:multi/components/BannerSlide.dart';
import 'package:multi/components/Categories.dart';
import 'package:multi/components/GourmetRestaurant.dart';
import 'package:multi/components/Location.dart';
import 'package:multi/components/Search.dart';
import 'package:multi/models/banner_card.dart';
import 'package:multi/models/bottom_navigator_item.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<CardImageItem> categories;
  final List<BottomNavigatorItem> menus;
  final List<CardImageItem> banners;

  const Home({
    @required this.categories,
    @required this.menus,
    @required this.banners,
  });

  List<BottomNavigationBarItem> _buildBottomIcon() => menus
      .map((menu) => BottomNavigationBarItem(
            icon: Icon(menu.icon, color: Colors.black),
            title: Text(menu.text, style: TextStyle(color: Colors.black)),
          ))
      .toList();

  Widget build(context) {
    return ListView(
      children: <Widget>[
        Location(),
        Search(),
        BannerSlide(items: banners),
        Categories(items: categories),
        GourmetRestaurants(),
      ],
    );
  }
}
