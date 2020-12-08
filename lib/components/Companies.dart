import 'package:multi/models/banner_card.dart';
import 'package:flutter/material.dart';

import 'CardImageRestaurant.dart';

class Companies extends StatelessWidget {
  final List<CardImageItem> items;

  const Companies({@required this.items});

  List<Widget> _buildCategories() => items
      .map((category) => CardImageRestaurant(
            image: category.image,
            text: category.text,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 12, left: 12),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              'Restaurantes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _buildCategories(),
            ),
          ),
        ],
      ),
    );
  }
}
