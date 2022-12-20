import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceListItemWidget extends StatefulWidget {
  const DeviceListItemWidget({
    Key? key,
    this.no,
    this.today,
    this.status,
  }) : super(key: key);

  final String? no;
  final int? today;
  final int? status;

  @override
  _DeviceListItemWidgetState createState() => _DeviceListItemWidgetState();
}

class _DeviceListItemWidgetState extends State<DeviceListItemWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 74.4,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/machine.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.no!,
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'dlc9eg2k' /* Today amount */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            formatNumber(
                              widget.today,
                              formatType: FormatType.compact,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (widget.status == -1)
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xCCFF0000),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                  shape: BoxShape.circle,
                ),
              ),
            if (widget.status == 0)
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xCDB3BAC1),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                  shape: BoxShape.circle,
                ),
              ),
            if (widget.status == 1)
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xCC00FF00),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
