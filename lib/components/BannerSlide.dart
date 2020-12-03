import 'package:Multi/components/CardImage.dart';
import 'package:Multi/models/banner_card.dart';
import 'package:flutter/material.dart';

class BannerSlide extends StatelessWidget {
  final List<CardImageItem> items;

  const BannerSlide({@required this.items});

  List<Widget> _buildBanners() => items
      .map((banner) => CardImage(
            image: banner.image,
            text: banner.text,
            format: CardImageType.category,
            textAlign: CrossAxisAlignment.start,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 15),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListView(
            padding: EdgeInsets.only(right: 12),
            scrollDirection: Axis.horizontal,
            children: _buildBanners(),
          ),
        ),
      ),
    );
  }
}
