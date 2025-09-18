import 'package:smart_qhwa/data/orders.dart';
import 'package:smart_qhwa/models/report/top_selling_model.dart';
import 'package:smart_qhwa/services/dashboard_service.dart';

class TopSellingDrink extends DashboardService {
  TopSellingDrink(this._orders);
  final OrderRepository _orders;

  @override
  TopSellingModel? calculate() {
    final Map<String, int> topSellingDrinkMap = {};

    for (var order in _orders.orders) {
      if (order.isComplete == true) {
        topSellingDrinkMap.update(
          order.drinks.name,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      }
    }

    if (topSellingDrinkMap.isEmpty) {
      return null;
    }

    final sorted = topSellingDrinkMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return TopSellingModel(sorted.first.key, sorted.first.value.toString());
  }
}
