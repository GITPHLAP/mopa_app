import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mopa_app/utility/values.dart';

class BeforeCalculation extends StatefulWidget {
  const BeforeCalculation({super.key});

  @override
  State<BeforeCalculation> createState() => _BeforeCalculationState();
}

class _BeforeCalculationState extends State<BeforeCalculation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(3),
        },
        children:  [
          TableRow(children: <Widget>[
            TableCell(
              
              child: Container(),),
            TableCell(child: Text("Total")),
            TableCell(child: Text("Sailing time")),
          ]),
          TableRow(children: <Widget>[
            TableCell(child: waterIcon),
            TableCell(child: waterIcon),
            TableCell(child: waterIcon),
          ]),
          TableRow(children: <Widget>[
            TableCell(child: greyIcon),
            TableCell(child: waterIcon),
            TableCell(child: waterIcon),
          ]),
          TableRow(children: <Widget>[
            TableCell(child: blackIcon),
            TableCell(child: waterIcon),
            TableCell(child: waterIcon),
          ]),
          TableRow(children: <Widget>[
            TableCell(child: fuelIcon),
            TableCell(child: waterIcon),
            TableCell(child: waterIcon),
          ]),
        ],
      ),
    );
  }
}

      // Column(
      //   children: [
      //     Expanded(child: Row(
      //       children: [
      //         waterIcon,
      //         Text("data")
      //       ],
      //     )),
      //     Expanded(child: Row(
      //       children: [
      //         greyIcon,
      //       ],
      //     )),
      //     Expanded(child: Row(
      //       children: [
      //         blackIcon,
      //       ],
      //     )),
      //     Expanded(child: Row(
      //       children: [
      //         fuelIcon,
      //       ],
      //     ))
      //   ],
      // ),