// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:math' as math;
import 'package:syncfusion_flutter_charts/charts.dart';

/// Private calss for storing the chart series data points.
class _ChartData {
  _ChartData(this.dt, this.qty);
  final DateTime dt;
  final num qty;
}

class SyncfusionFlutterChart extends StatefulWidget {
  const SyncfusionFlutterChart({
    Key? key,
    this.width,
    this.height,
    this.interval,
    required this.dateFormat,
    required this.fetchData,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int? interval;
  final int dateFormat;
  final Future<dynamic> Function() fetchData;

  @override
  _SyncfusionFlutterChartState createState() => _SyncfusionFlutterChartState();
}

class _SyncfusionFlutterChartState extends State<SyncfusionFlutterChart> {
  _SyncfusionFlutterChartState() {}

  Timer? timer;
  List<_ChartData>? chartData;
  late Future<dynamic> Function() _fetchData;

  late Future<List<_ChartData>> futureChartData;

  ChartSeriesController? _chartSeriesController;

  late bool isPointerMoved;
  @override
  void initState() {
    // _initializeVariables();
    _fetchData = widget.fetchData;
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    if (chartData != null) chartData!.clear();
    _chartSeriesController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timer?.cancel();
    chartData = null;
    futureChartData = _initializeVariables();
    timer = Timer.periodic(
        Duration(milliseconds: widget.interval ?? 5000), _updateDataSource);
    return Container(
        width: widget.width,
        height: widget.height,
        child: FutureBuilder<List<_ChartData>>(
          future: futureChartData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              chartData = snapshot.data;
              return _buildLiveLineChart();
            } else {
              return _buildLiveLineChart();
            }
          },
        ));
  }

  Future<List<_ChartData>> _initializeVariables() async {
    // design = widget.interval == null || widget.url == null;

    List<_ChartData> result = [];
    var data = await _fetchData();

    // if (widget.range == 0) {
    //   data = (await fetchSingleDeviceOutput24hAggregation());
    // } else if (widget.range == 1) {
    //   data = (await fetchSingleDeviceOutput7dAggregation());
    // } else if (widget.range == 2) {
    //   data = (await fetchSingleDeviceOutput30dAggregation());
    // }
    if (data != null) {
      for (dynamic d in data) {
        result.add(_ChartData(
            DateTime.fromMillisecondsSinceEpoch(d['ts']), d['value']));
      }
    }
    return result;
  }

  DateTimeIntervalType _intervalType() {
    if (widget.dateFormat == 0) {
      return DateTimeIntervalType.hours;
    } else {
      return DateTimeIntervalType.days;
    }
  }

  DateFormat _dateFormat() {
    if (widget.dateFormat == 0) {
      return DateFormat.H();
    } else {
      return DateFormat.d();
    }
  }

  /// Returns the realtime Cartesian line chart.
  SfCartesianChart _buildLiveLineChart() {
    return SfCartesianChart(
        tooltipBehavior:
            TooltipBehavior(enable: true, header: '', canShowMarker: true),
        zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enablePanning: true,
          enablePinching: true,
          enableSelectionZooming: true,
        ),
        plotAreaBorderWidth: 0,
        primaryXAxis: DateTimeAxis(
            majorGridLines: const MajorGridLines(width: 0),
            interval: 1,
            intervalType: _intervalType(),
            dateFormat: _dateFormat()),
        primaryYAxis: NumericAxis(
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0)),
        series: <LineSeries<_ChartData, DateTime>>[
          LineSeries<_ChartData, DateTime>(
              onRendererCreated: (ChartSeriesController controller) {
                _chartSeriesController = controller;
              },
              dataSource: chartData ?? [],
              color: const Color.fromRGBO(192, 108, 132, 1),
              xValueMapper: (_ChartData qty, _) => qty.dt,
              yValueMapper: (_ChartData qty, _) => qty.qty,
              animationDuration: 0,
              markerSettings: const MarkerSettings(isVisible: true))
        ]);
  }

  ///Continously updating the data source based on timer
  void _updateDataSource(Timer timer) {
    (() async {
      List<_ChartData> newChartData = await _initializeVariables();
      if (chartData != null && chartData!.length > 0) {
        if (newChartData[newChartData.length - 1].dt ==
            chartData![newChartData.length - 1].dt) {
          chartData![newChartData.length - 1] =
              newChartData[newChartData.length - 1];
          _chartSeriesController?.updateDataSource(
            updatedDataIndexes: <int>[chartData!.length - 1],
          );
        } else {
          chartData!.removeAt(0);
          chartData!.add(newChartData[newChartData.length - 1]);
          _chartSeriesController?.updateDataSource(
            addedDataIndexes: <int>[chartData!.length - 1],
            removedDataIndexes: <int>[0],
          );
        }
      }
    })();

    // chartData!.add(_ChartData(
    //     DateTime.now().add(Duration(hours: -dur)), _getRandomInt(10, 100)));
    // if (chartData!.length == 10) {
    //   chartData!.removeAt(0);
    //   _chartSeriesController?.updateDataSource(
    //     addedDataIndexes: <int>[chartData!.length - 1],
    //     removedDataIndexes: <int>[0],
    //   );
    // } else {
    //   _chartSeriesController?.updateDataSource(
    //     addedDataIndexes: <int>[chartData!.length - 1],
    //   );
    // }
    // count = count + 1;
    // dur = dur - 1;
  }

  ///Get the random data
  int _getRandomInt(int min, int max) {
    final math.Random random = math.Random();
    return min + random.nextInt(max - min);
  }
}
