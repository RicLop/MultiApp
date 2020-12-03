import 'package:Multi/components/BannerSlide.dart';
import 'package:Multi/components/Categories.dart';
import 'package:Multi/components/GourmetRestaurant.dart';
import 'package:Multi/components/Location.dart';
import 'package:Multi/components/Search.dart';
import 'package:Multi/models/banner_card.dart';
import 'package:Multi/models/bottom_navigator_item.dart';
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
