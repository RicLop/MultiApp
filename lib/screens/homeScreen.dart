import 'package:Multi/components/Carousel.dart';
import 'package:Multi/models/banner_card.dart';
import 'package:Multi/models/bottom_navigator_item.dart';
import 'package:Multi/screens/homeSiis.dart';
import 'package:flutter/material.dart';
import 'package:Multi/components/navDrawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/navDrawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var _color = Colors.white;
  var _saudeColor = Color(0xFF59E949);
  var _roupaColor = Color(0xFFFFCA38);
  var _comidaColor = Color(0xFFFF4444);
  var _petColor = Color(0xFF2E70FF);
  var _saudeSelected = false;
  var _roupaSelected = false;
  var _comidaSelected = false;
  var _petSelected = false;
  var _selectedColor = Colors.black;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: 4);
    _controller.addListener(() {
      onTabChange(_controller.index);
    });
  }

  void onTabChange(int value) {
    setState(() {
      deselectAll();
      if (value == 0) {
        //_color = _saudeColor;

        _saudeSelected = true;
      } else if (value == 1) {
        //_color = _roupaColor;

        _roupaSelected = true;
      } else if (value == 2) {
        //_color = _comidaColor;

        _comidaSelected = true;
      } else if (value == 3) {
        //_color = _petColor;

        _petSelected = true;
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
      appBar: AppBar(
        //title: Text("Titulo", style: TextStyle(color: Colors.black)),
        elevation: 10,
        backgroundColor: _color,
        centerTitle: true,
        bottom: TabBar(
            controller: _controller,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                  icon: Icon(FontAwesomeIcons.briefcaseMedical,
                      color: _saudeSelected ? _selectedColor : _saudeColor)),
              Tab(
                  icon: Icon(FontAwesomeIcons.tshirt,
                      color: _roupaSelected ? _selectedColor : _roupaColor)),
              Tab(
                  icon: Icon(FontAwesomeIcons.utensils,
                      color: _comidaSelected ? _selectedColor : _comidaColor)),
              Tab(
                  icon: Icon(FontAwesomeIcons.paw,
                      color: _petSelected ? _selectedColor : _petColor)),
            ]),
      ),
      body: TabBarView(controller: _controller, children: [
        CustomCarousel(),
        Text("2"),
        Home(menus: menus, categories: categories, banners: banners),
        Text("4")
      ]),
    );
  }

  final List<CardImageItem> banners = [
    CardImageItem(
        image: 'lib/assets/images/restaurantes-0.png',
        text: 'Confira sua entrega grátis na sacola'),
    CardImageItem(
        image: 'lib/assets/images/restaurantes-1.png',
        text: 'A taxa é corterisa para voce'),
    CardImageItem(
        image: 'lib/assets/images/restaurantes-2.png',
        text: 'Comida gostosa e sem taxas'),
    CardImageItem(
        image: 'lib/assets/images/retirar.png',
        text: 'Peça e retira no restaurante'),
  ];

  final List<CardImageItem> categories = [
    CardImageItem(image: 'lib/assets/images/pizza.png', text: 'Pizza'),
    CardImageItem(image: 'lib/assets/images/lanches.png', text: 'Lanches'),
    CardImageItem(image: 'lib/assets/images/acai.png', text: 'Açai'),
    CardImageItem(image: 'lib/assets/images/japonesa.png', text: 'Japonesa'),
    CardImageItem(image: 'lib/assets/images/bebidas.png', text: 'Bebidas'),
  ];

  final List<BottomNavigatorItem> menus = [
    BottomNavigatorItem(icon: Icons.home, text: 'Início'),
    BottomNavigatorItem(icon: Icons.search, text: 'Busca'),
    BottomNavigatorItem(icon: Icons.receipt, text: 'Pedidos'),
    BottomNavigatorItem(icon: Icons.person_outline, text: 'Perfil'),
  ];
}
