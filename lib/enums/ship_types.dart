enum ShipTypes{ 
  class900(
    name: "900"
  ), 
  class800(
    name: "800"
  );

  const ShipTypes({
    required this.name
  });

  final String name;
}