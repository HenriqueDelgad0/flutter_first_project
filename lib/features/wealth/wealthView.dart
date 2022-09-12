import 'package:flutter/material.dart';
import '../../components/balanceRow.dart';
import '../../components/cryptoRow.dart';

class WealthView extends StatelessWidget {
  const WealthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        ),
      ),
    );
  }
}