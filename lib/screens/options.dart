import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mopa_app/components/error_widget/custom_error_widget.dart';
import 'package:mopa_app/components/spinner/engine_spinner.dart';
import 'package:mopa_app/enums/ship_types.dart';
import 'package:mopa_app/provider/voyager_manager_provider.dart';
import 'package:mopa_app/provider/voyager_repository_provider.dart';
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
    final voyagerManager = ref.watch(voyagerManagerNotifierProvider);
    final shipType = ref.watch(getShipTypeProvider);
    return voyagerManager.when(data: (data) {
      _personAmountController.text = data.voyager.peopleCount.toString();
      return Scaffold(
        appBar: AppBar(
          title: const Text(optionPageTitle),
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
                      dropdownMenuEntries: ShipTypes.values
                          .map<DropdownMenuEntry<ShipTypes>>((e) {
                        return DropdownMenuEntry<ShipTypes>(
                            value: e, label: e.name);
                      }).toList(),
                      onSelected: onSelectShipType,
                    ),
                  ],
                ),
                const SizedBox(height: defaultSpace),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: onSaveButton, child: const Text("Save Voyager")),
                    TextButton(onPressed: onNewButton, child: const Text("New Voyager")),
                    TextButton(onPressed: onClearButton, child: const Text("Clear Everything")),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }, error: (err, s) {
      return const CustomErrorWidget();
    }, loading: () {
      return const EngineSpinnerWidget();
    });
  }

  void onSelectShipType(ShipTypes? value) {
    ref.read(voyagerManagerNotifierProvider.notifier).changeShip(value!);
  }

  void onEditingComplete() {
    ref
        .read(voyagerManagerNotifierProvider.notifier)
        .changeAmountOfPersons(int.parse(_personAmountController.text));
  }
  void onSaveButton() {
    ref
        .read(voyagerManagerNotifierProvider.notifier)
        .finishVoyager();
  }
  void onNewButton() {
    ref
        .read(voyagerManagerNotifierProvider.notifier)
        .newVoyager();
  }
  void onClearButton() {
    ref.read(voyagerManagerNotifierProvider.notifier)
        .clearDB();
  }
}
