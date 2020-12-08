import 'package:multi/models/banner_card.dart';
import 'package:multi/components/CardImageCategories.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List<CardImageItem> items;

  const Categories({@required this.items});

  List<Widget> _buildCategories() => items
      .map((category) => CardImageCategories(
            image: category.image,
            text: category.text,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 12, left: 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              'Categorias',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: _buildCategories(),
            ),
          ),
        ],
      ),
    );
  }
}
