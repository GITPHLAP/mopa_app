import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/components/error_widget/custom_error_widget.dart';
import 'package:mopa_app/components/spinner/engine_spinner.dart';
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
    return voyagerManager.when(data: (data) {
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
            TableCell(child: Text("${data.sumOfWaterBeforeReadings}L")),
            TableCell(child: Text("${data.daysOfSaillingAccordingWater().toStringAsFixed(2)} Days")),
          ]),
          TableRow(children: <Widget>[
            const TableCell(child: greyIcon),
            TableCell(child: Text("${data.sumOfGreyBeforeReadings}L")),
            TableCell(child: Text("${data.daysOfSaillingAccordingGrey().toStringAsFixed(2)} Days")),
          ]),
          TableRow(children: <Widget>[
            const TableCell(child: blackIcon),
            TableCell(child: Text("${data.sumOfBlackBeforeReadings}L")),
            TableCell(child: Text("${data.daysOfSaillingAccordingBlack().toStringAsFixed(2)} Days")),
          ]),
          TableRow(children: <Widget>[
            const TableCell(child: fuelIcon),
            TableCell(child: Text("${data.sumOfFuelBeforeReadings}L")),
            TableCell(child: Text("${data.hoursOfSaillingAccordingFuel().toStringAsFixed(2)} Hours")),
          ]),
        ],
      ),
    );
    },error: (error, stackTrace) {
      return const CustomErrorWidget();
    }, loading: () {
      return const EngineSpinnerWidget();
    },);
    
  }
}