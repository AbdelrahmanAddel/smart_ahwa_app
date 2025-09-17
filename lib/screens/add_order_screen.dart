// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smart_qhwa/data/orders.dart';
import 'package:smart_qhwa/models/drinks/aenab.dart';
import 'package:smart_qhwa/models/drinks/drinks.dart';
import 'package:smart_qhwa/models/drinks/coffee.dart';
import 'package:smart_qhwa/models/drinks/tea.dart';
import 'package:smart_qhwa/models/order/order_model.dart';

import 'package:smart_qhwa/widgets/widgets.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specialInstructionsController =
      TextEditingController();
  bool isComplete = false;

  final List<Drinks> drinks = [Coffee(), Tea(), Aenab()];
  late Drinks selectedDrink;

  @override
  void initState() {
    super.initState();
    selectedDrink = drinks[1];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          CustomTextFormField(_nameController, hintText: 'Customer Name'),
          SizedBox(height: 30),
          CustomTextFormField(
            _specialInstructionsController,
            hintText: 'special instructions',
          ),
          SizedBox(height: 30),
          Flexible(
            child: DrinkDropdown(
              onChanged: (value) {
                setState(() {
                  selectedDrink = value!;
                });
              },
              value: selectedDrink,
              drinks: drinks,
            ),
          ),
          SizedBox(height: 30),
          _orderCompleteWidget(),
          SizedBox(height: 30),
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            color: Colors.blueAccent,
            shape: StadiumBorder(),
            onPressed: () {
              _addOrder();
              _restData();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(selectedDrink.make())));
            },
            child: Text('Add Order', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _orderCompleteWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Order Complete', style: TextStyle(fontSize: 20)),
        SizedBox(width: 10),
        Checkbox(
          value: isComplete,
          onChanged: (value) {
            setState(() {
              isComplete = value!;
            });
          },
          activeColor: Colors.blueAccent,
        ),
      ],
    );
  }

  void _addOrder() {
    Orders.orders.add(
      OrderModel(
        _nameController.text,
        _specialInstructionsController.text,
        selectedDrink,
        selectedDrink.price,
        isComplete,
      ),
    );
  }

  void _restData() {
    _specialInstructionsController.clear();
    _nameController.clear();
    setState(() {
      isComplete = false;
    });
  }
}
