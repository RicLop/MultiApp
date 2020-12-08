import 'package:flutter/material.dart';

class CardImageCompany extends StatelessWidget {
  final String image;
  final String text;
  final CardImageType format;

  const CardImageCompany({
    @required this.image,
    @required this.text,
    this.format = CardImageType.banner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
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
