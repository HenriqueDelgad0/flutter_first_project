import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_first_application/components/balanceRow.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/cryptoRow.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(child: Scaffold(
        body: Column(
            children: const [
              BalanceRow(balanceValue: 20.525),
              CryptoRow(
                name: "ETH",
                value: 20.0,
                moneyType: "Ethereum",
                percentage: 75.0,
              ),
              CryptoRow(
                name: "HDO",
                value: 200.0,
                moneyType: "Bitcoin",
                percentage: 20.0,
              ),
              CryptoRow(
                name: "GD",
                value: 15.0,
                moneyType: "Litecoin",
                percentage: -0.50,
              )
            ]
        )
    ),);
  }
}

