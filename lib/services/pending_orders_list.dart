import 'package:smart_qhwa/data/orders.dart';
import 'package:smart_qhwa/models/order/order_model.dart';
import 'package:smart_qhwa/services/dashboard_service.dart';

class PendingOrdersList extends DashboardService {
  PendingOrdersList(this._orders);
  final OrderRepository _orders;
  @override
  List<OrderModel> calculate() {
    List<OrderModel> pendingOrderList = [];
    for (var order in _orders.orders) {
      if (order.isComplete == false) {
        pendingOrderList.add(order);
      }
    }
    return pendingOrderList;
  }
}
