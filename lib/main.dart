import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_first_application/components/balanceRow.dart';
import 'package:flutter_first_application/ds/atoms/Color.dart';
import 'package:flutter_first_application/features/home/homeView.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/cryptoRow.dart';
import 'features/transactions/transactionsView.dart';
import 'features/wealth/wealthView.dart';

final isVisibleProvider = StateProvider((_) => true);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Everest Project',
      theme: ThemeData(
        primarySwatch: appMainColor,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int _screenIndex = 0;
  final List<Widget> _screens = [
    const HomeView(),
    const WealthView(),
    const TransacationsView(),
  ];

  void onBottomBarClick(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        onTap: onBottomBarClick,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Carteiras",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_input_component_outlined),
            label: "Movimentações",
          )
        ],
      ),
    );
  }
}