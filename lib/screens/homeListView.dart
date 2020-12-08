import 'package:multi/components/BannerSlide.dart';
import 'package:multi/components/Categories.dart';
import 'package:multi/components/Companies.dart';
import 'package:multi/models/banner_card.dart';
import 'package:flutter/material.dart';

class HomeListView extends StatelessWidget {
  final List<CardImageItem> companies;
  final List<CardImageItem> categories;
  final List<CardImageItem> banners;

  const HomeListView({
    @required this.companies,
    @required this.categories,
    @required this.banners,
  });

  Widget build(context) {
    return ListView(
      children: <Widget>[
        Companies(items: companies),
        BannerSlide(items: banners),
        Categories(items: categories),
      ],
    );
  }
}
