import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/components/tank_widgets/ship_tanks_widget.dart';
import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/tank_models/tank.dart';
import 'package:mopa_app/provider/voyager_manager_provider.dart';
import 'package:mopa_app/screens/after/after_calculations.dart';
import 'package:mopa_app/utility/values.dart';

class AfterWidget extends ConsumerStatefulWidget {
  const AfterWidget({super.key});

  @override
  ConsumerState<AfterWidget> createState() => _AfterWidgetState();
}

class _AfterWidgetState extends ConsumerState<AfterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(afterPageTitle),
      ),
      body: Column(
        children: [
          ShipTanksWidget(onReadingChanged: onReadingChanged),
          // Calculation part
          const Expanded(
            child: AfterCalculationWidget(),
          ),
        ],
      ),
    );
  }

  /// Used to add and update a after reading when textField change
  void onReadingChanged(String val, Tank tank) {
    double? readingValue = double.tryParse(val);
    readingValue ??= 0;

    Reading newReading = Reading(tank: tank, value: readingValue);
    ref
        .read(voyagerManagerNotifierProvider.notifier)
        .addAfterReading(newReading);
  }
}
