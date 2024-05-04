import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/provider/voyager_manager_provider.dart';
import 'package:mopa_app/utility/values.dart';

class BeforeCalculation extends ConsumerStatefulWidget {
  const BeforeCalculation({super.key});

  @override
  ConsumerState<BeforeCalculation> createState() => _BeforeCalculationState();
}

class _BeforeCalculationState extends ConsumerState<BeforeCalculation> {
  @override
  Widget build(BuildContext context) {
    final voyagerManager = ref.watch(voyagerManagerNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(3),
        },
        children:  [
          const TableRow(children: <Widget>[
            TableCell(
              child: Text("Type"),
            ),
            TableCell(child: Text("Total")),
            TableCell(child: Text("Sailing time")),
          ]),
          TableRow(children: <Widget>[
            const TableCell(child: waterIcon),
            TableCell(child: Text("${voyagerManager.sumOfWaterBeforeReadings}L")),
            TableCell(child: Text("${voyagerManager.daysOfSaillingAccordingWater().toStringAsFixed(2)} Days")),
          ]),
          TableRow(children: <Widget>[
            const TableCell(child: greyIcon),
            TableCell(child: Text("${voyagerManager.sumOfGreyBeforeReadings}L")),
            TableCell(child: Text("${voyagerManager.daysOfSaillingAccordingGrey().toStringAsFixed(2)} Days")),
          ]),
          TableRow(children: <Widget>[
            const TableCell(child: blackIcon),
            TableCell(child: Text("${voyagerManager.sumOfBlackBeforeReadings}L")),
            TableCell(child: Text("${voyagerManager.daysOfSaillingAccordingBlack().toStringAsFixed(2)} Days")),
          ]),
          TableRow(children: <Widget>[
            const TableCell(child: fuelIcon),
            TableCell(child: Text("${voyagerManager.sumOfFuelBeforeReadings}L")),
            TableCell(child: Text("${voyagerManager.hoursOfSaillingAccordingFuel().toStringAsFixed(2)} Hours")),
          ]),
        ],
      ),
    );
  }
}