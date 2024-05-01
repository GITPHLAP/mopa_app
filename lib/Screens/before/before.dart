import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/components/tank_widgets/ship_tanks_widget.dart';
import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/tank_models/tank.dart';
import 'package:mopa_app/provider/voyager_manager_provider.dart';
import 'package:mopa_app/screens/before/before_calculations.dart';
import 'package:mopa_app/utility/values.dart';

class BeforeWidget extends ConsumerStatefulWidget {
  const BeforeWidget({super.key});

  @override
  ConsumerState<BeforeWidget> createState() => _BeforeWidgetState();
}

class _BeforeWidgetState extends ConsumerState<BeforeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(beforePageTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ShipTanksWidget(onReadingChanged: onReadingChanged),
          // Calculation part
          const Expanded(
            child: BeforeCalculation(),
          ),
        ],
      ),
    );
  }

  /// Used to add and update a before reading when textField change
  void onReadingChanged(String val, Tank tank) {
    double? readingValue = double.tryParse(val);
    readingValue ??= 0;

    Reading newReading = Reading(tank: tank, value: readingValue);
    ref
        .read(voyagerManagerNotifierProvider.notifier)
        .addBeforeReading(newReading);
  }
}
