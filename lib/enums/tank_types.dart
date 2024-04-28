import 'package:flutter/material.dart';
import 'package:mopa_app/utility/values.dart';

enum TankTypes {
  water(
    icon: waterIcon,
    name: "Water"
  ), 
  black(
    icon: blackIcon,
    name: "Black"
  ), 
  grey(
    icon: greyIcon,
    name: "Grey"
  ), 
  fuel(
    icon: fuelIcon,
    name: "Fuel"
  );

  const TankTypes({
    required this.icon,
    required this.name
  });

  final Icon icon;
  final String name;
}
