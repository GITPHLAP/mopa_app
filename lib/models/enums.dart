import 'package:flutter/material.dart';

enum Positions {forepeak, starboard, portside, daytank}

enum TankTypes {
  water(
    icon: Icon(Icons.local_drink),
    name: "Water"
  ), 
  black(
    icon: Icon(Icons.water_drop, color: Colors.brown,),
    name: "Black"
  ), 
  grey(
    icon: Icon(Icons.water_drop, color: Colors.blueGrey,),
    name: "Grey"
  ), 
  fuel(
    icon: Icon(Icons.oil_barrel),
    name: "Fuel"
  );

  const TankTypes({
    required this.icon,
    required this.name
  });

  final Icon icon;
  final String name;
}