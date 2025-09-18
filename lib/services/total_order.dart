import 'package:smart_qhwa/data/orders.dart';
import 'package:smart_qhwa/services/dashboard_service.dart';

class TotalOrderServed extends DashboardService {
  TotalOrderServed(this._orders);
  final OrderRepository _orders;
  @override
  int calculate() {
    int totalOrder = 0;
    for (var order in _orders.orders) {
      if (order.isComplete) {
        totalOrder++;
      }
    }
    return totalOrder;
  }
}
