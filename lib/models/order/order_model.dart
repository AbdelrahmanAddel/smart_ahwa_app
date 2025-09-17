import 'package:smart_qhwa/models/drinks/drinks.dart';

class OrderModel {
  final String _customerName;
  final String? _specialInstructions;
  final Drinks _drinks;
  final double _drinkPrice;
  final bool _isComplete;
  OrderModel(
    this._customerName,
    this._specialInstructions,
    this._drinks,
    this._drinkPrice,
    this._isComplete,
  );

  String get customerName => _customerName;
  String? get specialInstructions => _specialInstructions;
  Drinks get drinks => _drinks;
  double get drinkPrice => _drinkPrice;
  bool get isComplete => _isComplete;
}
