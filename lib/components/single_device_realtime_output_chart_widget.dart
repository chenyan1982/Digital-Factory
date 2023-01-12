import '../custom_code/actions/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleDeviceRealtimeOutputChartWidget extends StatefulWidget {
  const SingleDeviceRealtimeOutputChartWidget({
    Key? key,
    this.range,
    required this.deviceId,
  }) : super(key: key);

  final int? range;
  final String deviceId;

  @override
  _SingleDeviceRealtimeOutputChartWidgetState createState() =>
      _SingleDeviceRealtimeOutputChartWidgetState();
}

class _SingleDeviceRealtimeOutputChartWidgetState
    extends State<SingleDeviceRealtimeOutputChartWidget> {
  late int _range;
  late String _deviceId;

  @override
  void initState() {
    // TODO: implement initState
    _range = widget.range ?? 0;
    _deviceId = widget.deviceId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = FlutterFlowTheme.of(context).secondaryText;

    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                width: 400,
                height: 40,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        _range = 0;
                        setState(() {});
                      },
                      child: Text('24h',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color: _range == 0
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                              )),
                    ),
                    InkWell(
                      onTap: () async {
                        _range = 1;
                        setState(() {});
                      },
                      child: Text('7d',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color: _range == 1
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                              )),
                    ),
                    InkWell(
                      onTap: () async {
                        _range = 2;
                        setState(() {});
                      },
                      child: Text('30d',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color: _range == 2
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                              )),
                    ),
                    // Text(
                    //   '90d',
                    //   style: FlutterFlowTheme.of(context).bodyText1,
                    // ),
                    // Text(
                    //   '1y',
                    //   style: FlutterFlowTheme.of(context).bodyText1,
                    // ),
                    // Text(
                    //   'All',
                    //   style: FlutterFlowTheme.of(context).bodyText1,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: custom_widgets.SyncfusionFlutterChart(
            width: MediaQuery.of(context).size.width,
            height: 200,
            interval: 5000,
            dateFormat: _range,
            fetchData: () async {
              if (_range == 0) {
                return await fetchSingleDeviceOutput24hAggregation(_deviceId);
              } else if (_range == 1) {
                return await fetchSingleDeviceOutput7dAggregation(_deviceId);
              } else if (_range == 2) {
                return await fetchSingleDeviceOutput30dAggregation(_deviceId);
              }
            },
          ),
        ),
      ],
    );
  }
}
