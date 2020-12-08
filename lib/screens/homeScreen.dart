import 'package:multi/components/Carousel.dart';
import 'package:multi/components/Styles.dart';
import 'package:multi/models/banner_card.dart';
import 'package:multi/screens/homeListView.dart';
import 'package:flutter/material.dart';
import 'package:multi/components/navDrawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/navDrawer.dart';
import 'homeListView.dart';

class HomeScreen extends StatefulWidget {
  final SystemColors currentSystem;

  HomeScreen({this.currentSystem, Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _saudeSelected = false;
  bool _roupaSelected = false;
  bool _comidaSelected = false;
  bool _petSelected = false;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _comidaSelected = true;
    _controller = new TabController(vsync: this, length: 4, initialIndex: 2);
    _controller.addListener(() {
      onTabChange(_controller.index);
    });
  }

  void onTabChange(int value) {
    setState(() {
      deselectAll();
      if (value == 0) {
        _roupaSelected = true;
      } else if (value == 1) {
        _petSelected = true;
      } else if (value == 2) {
        _saudeSelected = true;
      } else if (value == 3) {
        _comidaSelected = true;
      }
    });
  }

  void deselectAll() {
    setState(() {
      _saudeSelected = false;
      _roupaSelected = false;
      _comidaSelected = false;
      _petSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      bottomNavigationBar: TabBar(
          controller: _controller,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
                icon: Icon(FontAwesomeIcons.cartArrowDown,
                    color: _roupaSelected
                        ? widget.currentSystem.roupaColor()
                        : widget.currentSystem.unselectedColor())),
            Tab(
                icon: Icon(FontAwesomeIcons.paw,
                    color: _petSelected
                        ? widget.currentSystem.petColor()
                        : widget.currentSystem.unselectedColor())),
            Tab(
                icon: Icon(FontAwesomeIcons.briefcaseMedical,
                    color: _saudeSelected
                        ? widget.currentSystem.saudeColor()
                        : widget.currentSystem.unselectedColor())),
            Tab(
                icon: Icon(FontAwesomeIcons.utensils,
                    color: _comidaSelected
                        ? widget.currentSystem.comidaColor()
                        : widget.currentSystem.unselectedColor())),
          ]),
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(),
              child: Container(
                  child: FlatButton(
                      color: Color(0x00FFFFFF),
                      onPressed: () {
                        setState(() {
                          widget.currentSystem.switchTheme();
                        });
                      },
                      child: new Icon(FontAwesomeIcons.lightbulb)))),
        ],
        elevation: 10,
        centerTitle: true,
      ),
      body: TabBarView(controller: _controller, children: [
        HomeListView(
            actualTab: AppTab.cloth,
            companies: companies,
            categories: categories,
            banners: banners),
        HomeListView(
            actualTab: AppTab.pet,
            companies: companies,
            categories: categories,
            banners: banners),
        HomeListView(
            actualTab: AppTab.pharmacy,
            companies: companies,
            categories: categories,
            banners: banners),
        HomeListView(
            actualTab: AppTab.restaurants,
            companies: companies,
            categories: categories,
            banners: banners),
      ]),
    );
  }

  final List<CardImageItem> banners = [
    CardImageItem(
        image: 'lib/assets/images/restaurantes-0.png',
        text: 'Confira sua entrega grátis na sacola'),
    CardImageItem(
        image: 'lib/assets/images/restaurantes-1.png',
        text: 'A taxa é cortesia para voce'),
    CardImageItem(
        image: 'lib/assets/images/restaurantes-2.png',
        text: 'Comida gostosa e sem taxas'),
    CardImageItem(
        image: 'lib/assets/images/retirar.png',
        text: 'Peça e retira no restaurante'),
  ];

  final List<CardImageItem> companies = [
    CardImageItem(image: 'lib/assets/images/company1.png', text: 'MC Donald'),
    CardImageItem(
        image: 'lib/assets/images/company2.png', text: 'Burguer King'),
    CardImageItem(image: 'lib/assets/images/company3.png', text: 'KFC'),
    CardImageItem(
        image: 'lib/assets/images/company4.png', text: 'Ben & Jarry\'s'),
    CardImageItem(image: 'lib/assets/images/bebidas.png', text: 'Trip N Trips'),
  ];

  final List<CardImageItem> categories = [
    CardImageItem(image: 'lib/assets/images/pizza.png', text: 'Pizza'),
    CardImageItem(image: 'lib/assets/images/lanches.png', text: 'Lanches'),
    CardImageItem(image: 'lib/assets/images/acai.png', text: 'Açai'),
    CardImageItem(image: 'lib/assets/images/japonesa.png', text: 'Japonesa'),
    CardImageItem(image: 'lib/assets/images/bebidas.png', text: 'Bebidas'),
  ];
}
