import 'package:flutter/material.dart';
import 'package:smart_qhwa/models/drinks/drinks.dart';

class DrinkDropdown extends StatelessWidget {
  const DrinkDropdown({
    super.key,
    required this.onChanged,
    required this.value,
    required this.drinks,
  });
  
  final void Function(Drinks?)? onChanged;
  final Drinks value;
  final List<Drinks> drinks;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Drinks>(
      value: value,
      decoration: const InputDecoration(
        labelText: "Choose Option",
        border: OutlineInputBorder(),
      ),
      items: drinks
          .map(
            (drink) =>
                DropdownMenuItem<Drinks>(value: drink, child: Text(drink.name)),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
