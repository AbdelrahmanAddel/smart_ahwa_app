import 'package:flutter/material.dart';
import 'package:smart_qhwa/data/orders.dart';
import 'package:smart_qhwa/models/drinks/aenab.dart';
import 'package:smart_qhwa/models/drinks/drinks.dart';
import 'package:smart_qhwa/models/drinks/coffee.dart';
import 'package:smart_qhwa/models/drinks/tea.dart';
import 'package:smart_qhwa/models/order/order_model.dart';
import 'package:smart_qhwa/widgets/custom_text_form_field.dart';
import 'package:smart_qhwa/widgets/drink_dropdown.dart';


class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen(this._orderRepository, {super.key});
  final OrderRepository _orderRepository;

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specialInstructionsController =
      TextEditingController();
  bool isComplete = false;

  final List<Drinks> drinks = [Tea(), Coffee(), Aenab()];
  late Drinks selectedDrink;

  @override
  void initState() {
    super.initState();
    selectedDrink = drinks.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      _nameController,
                      hintText: 'Customer Name',
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      _specialInstructionsController,
                      hintText: 'Special Instructions',
                    ),
                    const SizedBox(height: 20),
                    DrinkDropdown(
                      value: selectedDrink,
                      drinks: drinks,
                      onChanged: (value) {
                        setState(() {
                          selectedDrink = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            _orderCompleteWidget(),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  _addOrder();
                  _resetData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${selectedDrink.make()} added!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text(
                  'Add Order',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderCompleteWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Order Complete',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 10),
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
    widget._orderRepository.addOrder(
      OrderModel(
        _nameController.text,
        _specialInstructionsController.text,
        selectedDrink,
        selectedDrink.price,
        isComplete,
      ),
    );
  }

  void _resetData() {
    _specialInstructionsController.clear();
    _nameController.clear();
    setState(() {
      isComplete = false;
      selectedDrink = drinks.first;
    });
  }
}