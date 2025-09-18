import 'package:smart_qhwa/models/order/order_model.dart';
import 'package:smart_qhwa/services/dashboard_service.dart';

abstract class Dashboard {
  // int get pendingOrder;
  List<OrderModel> get pendingOrderList;
}

class NormalDashboard extends Dashboard {
  final DashboardService _pendingOrder;

  NormalDashboard({required DashboardService pendingOrder})
    : _pendingOrder = pendingOrder;

  // @override
  // int get pendingOrder => _pendingOrder.calculate();

  @override
  List<OrderModel> get pendingOrderList => _pendingOrder.calculate();
}
