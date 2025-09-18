import 'package:flutter/material.dart';
import 'package:smart_qhwa/data/orders.dart';
import 'package:smart_qhwa/screens/see_report.dart';
import 'package:smart_qhwa/services/create_report.dart';
import 'package:smart_qhwa/services/pending_order.dart';
import 'package:smart_qhwa/services/top_selling_drink.dart';
import 'package:smart_qhwa/services/total_order.dart';
import 'package:smart_qhwa/widgets/pending_order_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen(this._orders, {super.key});

  final OrderRepository _orders;

  @override
  Widget build(BuildContext context) {
    final pendingOrders = PendingOrder(_orders).calculate();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => SeeReport(
                    NormalDashboardReport(
                      TotalOrderServed(_orders),
                      TopSellingDrink(_orders),
                    ).getReport(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.bar_chart, color: Colors.white),
            label: const Text(
              'See Report',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),

          // Pending Orders Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Pending Orders: ${pendingOrders.length}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Pending Orders List
          Expanded(child: PendingOrdersList(pendingOrders)),
        ],
      ),
    );
  }
}
