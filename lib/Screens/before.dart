import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/models/components/tank_list.dart';
import 'package:mopa_app/provider/voyager_provider.dart';

import '../enums/tank_types.dart';

class BeforeWidget extends ConsumerWidget {
  const BeforeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ship = ref.watch(getShipProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Before"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                TankList(ship.tanks
                    .where((element) => element.type == TankTypes.water)
                    .toList()),
                const SizedBox(
                  width: 10,
                ),
                TankList(ship.tanks
                    .where((element) =>
                        element.type == TankTypes.black ||
                        element.type == TankTypes.grey)
                    .toList()),
                const SizedBox(
                  width: 10,
                ),
                TankList(ship.tanks
                    .where((element) => element.type == TankTypes.fuel)
                    .toList()),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const Expanded(child: Text("data")),
        ],
      ),
    );
  }
}
