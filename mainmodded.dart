import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(_ChartApp());

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motorcycle Sales Graph',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motorcycle Sales'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Month')), // String months
        primaryYAxis: NumericAxis(title: AxisTitle(text: 'Sales (Units)')), // Numbers
        title: ChartTitle(text: 'Monthly Motorcycle Sales (2025)'),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries<_SalesData, String>>[
          // Yamaha Sales
          LineSeries<_SalesData, String>(
            name: 'Yamaha',
            color: Colors.blue,
            dataSource: salesDataYamaha,
            xValueMapper: (_SalesData sales, _) => sales.month, // String
            yValueMapper: (_SalesData sales, _) => sales.value, // Number
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),

          // Honda Sales
          LineSeries<_SalesData, String>(
            name: 'Honda',
            color: Colors.red,
            dataSource: salesDataHonda,
            xValueMapper: (_SalesData sales, _) => sales.month,
            yValueMapper: (_SalesData sales, _) => sales.value,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),

          // Suzuki Sales
          LineSeries<_SalesData, String>(
            name: 'Suzuki',
            color: Colors.green,
            dataSource: salesDataSuzuki,
            xValueMapper: (_SalesData sales, _) => sales.month,
            yValueMapper: (_SalesData sales, _) => sales.value,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.month, this.value);

  final String month; // Month (x-axis)
  final double value; // Sales (y-axis)
}

// Yamaha Sales Data
final List<_SalesData> salesDataYamaha = [
  _SalesData('Jan', 2500),
  _SalesData('Feb', 2800),
  _SalesData('Mar', 3000),
  _SalesData('Apr', 2700),
  _SalesData('May', 3500),
  _SalesData('Jun', 4000),
];

// Honda Sales Data
final List<_SalesData> salesDataHonda = [
  _SalesData('Jan', 2200),
  _SalesData('Feb', 2400),
  _SalesData('Mar', 2800),
  _SalesData('Apr', 3000),
  _SalesData('May', 3700),
  _SalesData('Jun', 4200),
];

// Suzuki Sales Data
final List<_SalesData> salesDataSuzuki = [
  _SalesData('Jan', 1800),
  _SalesData('Feb', 2000),
  _SalesData('Mar', 2200),
  _SalesData('Apr', 2500),
  _SalesData('May', 2800),
  _SalesData('Jun', 3100),
];
