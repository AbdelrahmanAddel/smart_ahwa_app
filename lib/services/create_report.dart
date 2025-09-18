import 'package:smart_qhwa/models/report/report.dart';
import 'package:smart_qhwa/models/report/top_selling_model.dart';
import 'package:smart_qhwa/services/dashboard_service.dart';

abstract class Report {
  ReportModel getReport();
}

class NormalDashboardReport extends Report {
  NormalDashboardReport(this._totalOrder, this._topSelling);

  final DashboardService _totalOrder;
  final DashboardService _topSelling;

  @override
  ReportModel getReport() {
    return ReportModel(
      _totalOrder.calculate() ?? 0,
      _topSelling.calculate() ?? TopSellingModel('', '0'),
    );
  }
}
