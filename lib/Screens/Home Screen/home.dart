import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:travel_academy/Constant%20Data/app_colors.dart';
import 'package:travel_academy/Screens/Home%20Screen/home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> _screenList = [
    HomeScreen(),
    Text('Second Screen'),
    Text('Third Screen'),
    Text('Fourth Screen')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(selectedItemColor: titleColor, unselectedItemColor: subtitleColor,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          items: const [
        BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: ''),
        BottomNavigationBarItem(icon: Icon(IconlyLight.discovery), label: ''),
        BottomNavigationBarItem(icon: Icon(IconlyLight.notification), label: ''),
        BottomNavigationBarItem(icon: Icon(IconlyLight.category), label: ''),
      ]),
      body: Center(child: _screenList.elementAt(selectedIndex)),
    );
  }
}
