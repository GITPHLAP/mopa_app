import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/components/tank_list.dart';
import 'package:mopa_app/enums/tank_types.dart';
import 'package:mopa_app/models/tank_models/tank.dart';
import 'package:mopa_app/provider/voyager_manager_provider.dart';
import 'package:mopa_app/utility/values.dart';

/// Widget to display all tanks for the seleted ship
class ShipTanksWidget extends ConsumerWidget {
  const ShipTanksWidget({super.key, required this.onReadingChanged});

  final Function(String val, Tank tank) onReadingChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ship = ref.watch(getShipProvider);
    return Expanded(
      child: Row(
        children: [
          const SizedBox(width: defaultSpace),
          TankList(
            ship.tanks
                .where((element) => element.type == TankTypes.water)
                .toList(),
            onChanged: onReadingChanged,
          ),
          const SizedBox(width: defaultSpace),
          TankList(
            ship.tanks
                .where((element) =>
                    element.type == TankTypes.black ||
                    element.type == TankTypes.grey)
                .toList(),
            onChanged: onReadingChanged,
          ),
          const SizedBox(width: defaultSpace),
          TankList(
            ship.tanks
                .where((element) => element.type == TankTypes.fuel)
                .toList(),
            onChanged: onReadingChanged,
          ),
          const SizedBox(width: defaultSpace),
        ],
      ),
    );
  }
}
