import 'package:flutter/material.dart';
import 'package:flutter_app/screens/profile/profile_screen.dart';
import 'signup/cad_screen.dart';
import 'conecdb.dart';
import 'noticias.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _indiceAtual = 0;

  final List<Widget> _telas = [
    Noticias(),
    ConecDB(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: buildAppBottomNavBar(),
    );
  }
  BottomNavigationBar buildAppBottomNavBar(){
    return BottomNavigationBar(
      currentIndex: _indiceAtual,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            title: Text("Notícias")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text("Favoritos"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text("Perfil"),
        ),
      ],
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
