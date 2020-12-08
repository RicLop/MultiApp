import 'package:flutter/material.dart';

class CardImageRestaurant extends StatelessWidget {
  final String image;
  final String text;
  final CardImageType format;

  const CardImageRestaurant({
    @required this.image,
    @required this.text,
    this.format = CardImageType.banner,
  });

  @override
  Widget build(BuildContext context) {
    final double imageHeight = handleImageHeight(format);

    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Text(
            text,
            style: TextStyle(),
          ),
        ],
      ),
    );
  }
}

enum CardImageType {
  banner,
  category,
}

double handleImageHeight(CardImageType type) {
  final banners = {
    CardImageType.banner: 70.0,
    CardImageType.category: 140.0,
  };
  return banners[type];
}
