import 'package:digital_factory/components/single_device_realtime_output_chart_widget.dart';

import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceInfoWidget extends StatefulWidget {
  const DeviceInfoWidget({
    Key? key,
    this.deviceName,
    required this.deviceId,
  }) : super(key: key);

  final String? deviceName;
  final String deviceId;

  @override
  _DeviceInfoWidgetState createState() => _DeviceInfoWidgetState();
}

class _DeviceInfoWidgetState extends State<DeviceInfoWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late String _deviceId;

  @override
  void initState() {
    _deviceId = widget.deviceId;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'g5f15rpi' /* Device Info */,
          ),
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: FlutterFlowTheme.of(context).title3Family,
                fontSize: 24,
                fontWeight: FontWeight.normal,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title3Family),
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.deviceName!,
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'n4wug23j' /* Fleet Model 42 */,
                        ),
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    child: SingleDeviceRealtimeOutputChartWidget(
                      deviceId: _deviceId,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'h6ud908v' /* Utilization rate */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                FFAppState().utilRate,
                                formatType: FormatType.percent,
                              ),
                              '0.7235',
                            ),
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'tkjsv50t' /* Speed */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                FFAppState().speed,
                                formatType: FormatType.compact,
                              ),
                              '6',
                            ),
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '0wi8tqjp' /* Status */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                          Text(
                            () {
                              if (FFAppState().status == -1) {
                                return 'Error';
                              } else if (FFAppState().status == 0) {
                                return 'Stop';
                              } else {
                                return 'Good';
                              }
                            }(),
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title1Family,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .title1Family),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
