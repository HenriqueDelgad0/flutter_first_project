import 'package:flutter/material.dart';
import 'package:flutter_first_application/extensions/stringExtensions.dart';
import 'package:flutter_first_application/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BalanceRow extends ConsumerWidget {
  final double? balanceValue;

  const BalanceRow({Key? key, required this.balanceValue})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isVisible = ref.watch(isVisibleProvider);
      return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Carteira',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        fontFamily: 'Montserrat'),
                  ),
                  IconButton(icon: const Icon(Icons.remove_red_eye), iconSize: 24.0, onPressed: () {
                    ref.watch(isVisibleProvider.notifier).state = !isVisible;
                  })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    ref.watch(isVisibleProvider)? 'US\$ $balanceValue,00'.maskCurrentString()
                        : 'US\$ $balanceValue,00',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        fontFamily: 'Montserrat'),
                  )
                ],
              ),
            )]);
    }
}
