import 'package:flutter/material.dart';
import 'package:smart_qhwa/screens/add_order_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: _bottomNavigationBar(),
        body: _currentIndex == 0 ? AddOrderScreen() : Placeholder(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: _currentIndex,
      onTap: (value) => setState(() {
        _currentIndex = value;
      }),

      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.add, size: 34, color: Colors.black),
          label: 'Add Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard, size: 34, color: Colors.black),
          label: 'Dashboard',
        ),
      ],
    );
  }
}
