import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/components/error_widget/custom_error_widget.dart';
import 'package:mopa_app/components/spinner/engine_spinner.dart';
import 'package:mopa_app/enums/tank_types.dart';
import 'package:mopa_app/provider/voyager_manager_provider.dart';
import 'package:mopa_app/utility/values.dart';

class AfterCalculationWidget extends ConsumerStatefulWidget {
  const AfterCalculationWidget({super.key});

  @override
  ConsumerState<AfterCalculationWidget> createState() =>
      _AfterCalculationWidgetState();
}

class _AfterCalculationWidgetState
    extends ConsumerState<AfterCalculationWidget> {
  @override
  Widget build(BuildContext context) {
    final voyagerManager = ref.watch(voyagerManagerNotifierProvider);
    return voyagerManager.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(3),
            },
            children: [
              const TableRow(children: <Widget>[
                TableCell(
                  child: Text("Type"),
                ),
                TableCell(child: Text("Total (L)")),
                TableCell(child: Text("Usage (L)")),
              ]),
              TableRow(children: <Widget>[
                const TableCell(child: waterIcon),
                TableCell(child: Text("${data.sumOfWaterAfterReadings}")),
                TableCell(
                    child:
                        Text(data.usageOf(TankTypes.water).toStringAsFixed(2))),
              ]),
              TableRow(children: <Widget>[
                const TableCell(child: greyIcon),
                TableCell(child: Text("${data.sumOfGreyAfterReadings}")),
                TableCell(
                    child:
                        Text(data.usageOf(TankTypes.grey).toStringAsFixed(2))),
              ]),
              TableRow(children: <Widget>[
                const TableCell(child: blackIcon),
                TableCell(child: Text("${data.sumOfBlackAfterReadings}")),
                TableCell(
                    child:
                        Text(data.usageOf(TankTypes.black).toStringAsFixed(2))),
              ]),
              TableRow(children: <Widget>[
                const TableCell(child: fuelIcon),
                TableCell(child: Text("${data.sumOfFuelAfterReadings}")),
                TableCell(
                    child:
                        Text(data.usageOf(TankTypes.fuel).toStringAsFixed(2))),
              ]),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return const CustomErrorWidget();
      },
      loading: () {
        return const EngineSpinnerWidget();
      },
    );
  }
}
