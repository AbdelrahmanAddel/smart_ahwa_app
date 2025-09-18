import 'package:flutter/material.dart';
import 'package:smart_qhwa/models/order/order_model.dart';

class PendingOrdersList extends StatelessWidget {
  const PendingOrdersList(this._pendingOrderList, {super.key});
  final List<OrderModel> _pendingOrderList;

  @override
  Widget build(BuildContext context) {
    if (_pendingOrderList.isEmpty) {
      return const Center(
        child: Text(
          "No Pending Orders 🎉",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 12),
      itemCount: _pendingOrderList.length,
      itemBuilder: (BuildContext context, int index) {
        final order = _pendingOrderList[index];
        return _pendingOrderWidget(order);
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 12),
    );
  }

  Widget _pendingOrderWidget(OrderModel order) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text(
            order.drinks.name[0], // أول حرف من اسم المشروب
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        title: Text(
          order.drinks.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Price: ${order.drinks.price}"),
            Text("Customer: ${order.customerName}"),
          ],
        ),
        trailing: const Icon(Icons.timer, color: Colors.orange),
      ),
    );
  }
}
