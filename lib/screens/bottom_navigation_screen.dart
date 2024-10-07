import 'package:flutter/material.dart';
import 'package:travel_app/screens/guide_screen.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/search_screen.dart';
import 'package:travel_app/screens/trip_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final _list = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const TripScreen(),
    const GuideScreen()
  ];

  int _currentScreen = 0;

  _changeScreen(int position) {
    setState(() {
      _currentScreen = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentScreen,
        children: _list,
      ),
      floatingActionButton: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: 60,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBottomNavButton(0),
              _buildBottomNavButton(1),
              _buildBottomNavButton(2),
              _buildBottomNavButton(3),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildBottomNavButton(int position) {
    return GestureDetector(
        onTap: () {
          _changeScreen(position);
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),padding: const EdgeInsets.all(3),
            height: 50,
            width: 70,
            decoration:  BoxDecoration(
              color: position==_currentScreen ? Colors.red:null,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Icon(
             position == 0? Icons.home : position==1?Icons.search:position==2?Icons.calendar_month_outlined:Icons.add_business_outlined,
              size: 30,
              color: _currentScreen == position ? Colors.white : Colors.black,
            )));
  }
}
