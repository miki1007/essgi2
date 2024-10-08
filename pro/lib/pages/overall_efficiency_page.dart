import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class OverallEfficiencyPage extends StatelessWidget {
  final List<charts.Series<TaskData, String>> _seriesPieData;

  OverallEfficiencyPage({Key? key})
      : _seriesPieData = _createSampleData(),
        super(key: key);

  // Mock data for pie chart
  static List<charts.Series<TaskData, String>> _createSampleData() {
    final data = [
      TaskData('Completed', 35, Colors.green),
      TaskData('Pending', 25, Colors.orange),
      TaskData('Ongoing', 30, Colors.blue),
      TaskData('Cancelled', 10, Colors.red),
    ];

    return [
      charts.Series<TaskData, String>(
        id: 'Efficiency',
        domainFn: (TaskData task, _) => task.status,
        measureFn: (TaskData task, _) => task.count,
        colorFn: (TaskData task, _) =>
            charts.ColorUtil.fromDartColor(task.color),
        data: data,
        labelAccessorFn: (TaskData row, _) => '${row.status}: ${row.count}%',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overall Efficiency'),
        backgroundColor: Colors.blue.shade900,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Task Status Breakdown",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(seconds: 2),
                          behaviors: [
                            charts.DatumLegend(
                              position: charts.BehaviorPosition.end,
                              horizontalFirst: false,
                              desiredMaxColumns: 1,
                              cellPadding:
                                  EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                color: charts.MaterialPalette.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                          defaultRenderer: charts.ArcRendererConfig(
                            arcWidth: 100,
                            arcRendererDecorators: [
                              charts.ArcLabelDecorator(
                                labelPosition: charts.ArcLabelPosition.inside,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: _buildEfficiencySummary(context),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Custom summary of efficiency below the pie chart
  Widget _buildEfficiencySummary(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      color: Colors.white,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEfficiencyRow(
              context,
              status: 'Completed',
              count: 35,
              color: Colors.green,
            ),
            _buildEfficiencyRow(
              context,
              status: 'Pending',
              count: 25,
              color: Colors.orange,
            ),
            _buildEfficiencyRow(
              context,
              status: 'Ongoing',
              count: 30,
              color: Colors.blue,
            ),
            _buildEfficiencyRow(
              context,
              status: 'Cancelled',
              count: 10,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEfficiencyRow(
    BuildContext context, {
    required String status,
    required int count,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10),
              Text(
                status,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Text(
            '$count%',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class TaskData {
  final String status;
  final int count;
  final Color color;

  TaskData(this.status, this.count, this.color);
}
