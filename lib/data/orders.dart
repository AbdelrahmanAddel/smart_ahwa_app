import 'package:smart_qhwa/models/order/order_model.dart';

abstract class OrderRepository {
  List<OrderModel> get getAllOrders;
  List<OrderModel> get orders;
  void addOrder(OrderModel order);
}

class MemoryOrderRepository extends OrderRepository {
  MemoryOrderRepository._();
  static final MemoryOrderRepository instance = MemoryOrderRepository._();

  @override
  List<OrderModel> orders = [];
  @override
  void addOrder(OrderModel order) {
    if (order.customerName.isNotEmpty) {
      orders.add(order);
    }
  }

  @override
  List<OrderModel> get getAllOrders => orders;
}
