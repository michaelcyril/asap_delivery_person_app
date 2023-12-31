// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:delivery_rider_app/components/drawer_component.dart';
import 'package:delivery_rider_app/screens/deliveries.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:delivery_rider_app/constants/constants.dart';
import 'delivery_order_history.dart';
import 'home_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late final onPressed;
  int _selectedIndex = 0;
  var appbarTitle = "Orders";

  final List<Widget> _screens = [
    const HomePage(),
    const Deliveries(),
    const DeliveryHistory(),
  ];

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        setState(() {
          appbarTitle = "Orders";
        });
        break;
      case 1:
        setState(() {
          appbarTitle = "Accepted Active Deliveries";
        });
        break;
      case 2:
        setState(() {
          appbarTitle = "Delivery Histories";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          appbarTitle,
          style: kTextStyle1,
        ),
      ),
      drawer: const DrawerComponent(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        child: GNav(
          gap: 8,
          activeColor: kBackgroundColor,
          padding: const EdgeInsets.all(8.0),
          color: Colors.black,
          selectedIndex: _selectedIndex,
          onTabChange: onTap,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.delivery_dining,
              text: 'Deliveries',
            ),
            GButton(
              icon: Icons.history,
              text: 'History',
            ),
          ],
        ),
      ),
    );
  }
}
