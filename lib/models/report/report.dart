import 'package:smart_qhwa/models/report/top_selling_model.dart';

class ReportModel {
  final int _totalOrders;
  final TopSellingModel _topSellingDrink;

  ReportModel(this._totalOrders, this._topSellingDrink);

  int get totalOrders => _totalOrders;
  TopSellingModel get topSellingDrinkData => _topSellingDrink;
}
