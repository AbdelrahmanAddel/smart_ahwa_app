import 'package:flutter/material.dart';
import 'package:smart_qhwa/data/orders.dart';
import 'package:smart_qhwa/screens/add_order_screen.dart';
import 'package:smart_qhwa/screens/dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final OrderRepository _orders = MemoryOrderRepository.instance;

  final List<String> _titles = ["Add Order", "Dashboard"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            _titles[_currentIndex],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: _currentIndex == 0
            ? AddOrderScreen(_orders)
            : DashboardScreen(_orders),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap: (value) => setState(() {
        _currentIndex = value;
      }),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add, size: 28),
          label: 'Add Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard, size: 28),
          label: 'Dashboard',
        ),
      ],
    );
  }
}