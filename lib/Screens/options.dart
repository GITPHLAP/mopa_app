import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/enums/ship_types.dart';
import 'package:mopa_app/provider/voyager_provider.dart';
import 'package:mopa_app/utility/values.dart';

class OptionsWidget extends ConsumerStatefulWidget {
  const OptionsWidget({super.key});

  @override
  ConsumerState<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends ConsumerState<OptionsWidget> {
  final _personAmountController = TextEditingController();

  @override
  void dispose() {
    _personAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final voyager = ref.watch(voyagerNotifierProvider);
    final shipType = ref.watch(getShipTypeProvider);
    _personAmountController.text = voyager.peopleCount.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text(optionPageTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Center(
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.8,
                child: TextField(
                  autofocus: false,
                  controller: _personAmountController,
                  onTapOutside: (event) {
                    onEditingComplete();
                    FocusScope.of(context).unfocus();
                  },
                  onEditingComplete: onEditingComplete,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text(amountOfPersons),
                  ),
                ),
              ),
              const SizedBox(height: defaultSpace),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(selectShipType),
                  const SizedBox(width: defaultSpace),
                  DropdownMenu<ShipTypes>(
                    initialSelection: shipType,
                    dropdownMenuEntries:
                        ShipTypes.values.map<DropdownMenuEntry<ShipTypes>>((e) {
                      return DropdownMenuEntry<ShipTypes>(
                          value: e, label: e.name);
                    }).toList(),
                    onSelected: onSelectShipType,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSelectShipType(ShipTypes? value) {
    ref.read(voyagerNotifierProvider.notifier).changeShip(value!);
  }

  void onEditingComplete() {
    ref
        .read(voyagerNotifierProvider.notifier)
        .changeAmountOfPersons(int.parse(_personAmountController.text));
  }
}
