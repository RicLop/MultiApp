import 'package:multi/models/banner_card.dart';
import 'package:flutter/material.dart';

import '../screens/homeListView.dart';
import '../screens/homeListView.dart';
import 'CardImageCompanies.dart';

class Companies extends StatelessWidget {
  final List<CardImageItem> items;
  final AppTab actualTab;

  const Companies({@required this.actualTab, @required this.items});

  List<Widget> _buildCategories() => items
      .map((category) => CardImageCompany(
            image: category.image,
            text: category.text,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(top: 12, left: 12),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              getTitle(this.actualTab),
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

  String getTitle(AppTab actualTab) {
    switch (actualTab) {
      case AppTab.pharmacy:
        return 'Farmácias';
        break;
      case AppTab.cloth:
        return 'Lojas';
        break;
      case AppTab.restaurants:
        return 'Restaurantes';
        break;
      case AppTab.pet:
        return 'PetShops';
        break;
      default:
    }
  }
}
