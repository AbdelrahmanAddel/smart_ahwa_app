import 'package:flutter/material.dart';
import 'package:smart_qhwa/models/report/report.dart';


class SeeReport extends StatelessWidget {
  const SeeReport(this._report, {super.key});

  final ReportModel _report;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'See Report',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _reportCard(
              icon: Icons.local_cafe,
              title: 'Top Selling Drink',
              value: _report.topSellingDrinkData.name,
              color: Colors.orange,
            ),
            const SizedBox(height: 16),
            _reportCard(
              icon: Icons.bar_chart,
              title: 'Top Selling Drink Count',
              value: _report.topSellingDrinkData.count,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 16),
            _reportCard(
              icon: Icons.shopping_cart,
              title: 'Total Orders Served',
              value: _report.totalOrders.toString(),
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _reportCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              radius: 28,
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}