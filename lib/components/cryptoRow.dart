  import 'package:flutter/material.dart';
  import 'package:flutter_first_application/extensions/stringExtensions.dart';
  import "package:hooks_riverpod/hooks_riverpod.dart";

  import '../main.dart';

  class CryptoRow extends ConsumerWidget {
    final String name;
    final double value;
    final String moneyType;
    final double percentage;

    const CryptoRow(
        {Key? key,
        required this.name,
        required this.value,
        required this.moneyType, required this.percentage})
        : super(key: key);

    @override
    Widget build(BuildContext context, WidgetRef ref) {
      bool isVisible = ref.watch(isVisibleProvider);

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Divider(
            color: Color(0xffE3E4EB),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 8),
                    child: Image(
                      image: AssetImage("images/RoundCircle.png"),
                      height: 50,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            fontFamily: 'Source Sans Pro'),
                      ),
                      Text(
                        moneyType,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            fontFamily: 'Source Sans Pro',
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      ref.watch(isVisibleProvider)? "US\$ $value".maskCurrentString(): "US\$ $value",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          fontFamily: 'Source Sans Pro'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 52,
                        color: percentage >= 0? const Color(0xffA0F4E0): const Color(0xffF7A1A1),
                        child:
                        Text(
                          ref.watch(isVisibleProvider)? "$percentage%".maskCurrentString(): "$percentage%",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              fontFamily: 'Source Sans Pro'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    }
  }
