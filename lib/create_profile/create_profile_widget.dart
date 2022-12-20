import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfileWidget extends StatefulWidget {
  const CreateProfileWidget({Key? key}) : super(key: key);

  @override
  _CreateProfileWidgetState createState() => _CreateProfileWidgetState();
}

class _CreateProfileWidgetState extends State<CreateProfileWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? yourNameController;
  TextEditingController? cityController;
  String? stateValue;
  TextEditingController? myBioController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    cityController = TextEditingController();
    yourNameController = TextEditingController();
    myBioController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    cityController?.dispose();
    yourNameController?.dispose();
    myBioController?.dispose();
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
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'rdqckjrg' /* Create Profile */,
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
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 570,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 44, 16, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'lz5owbq9' /* Create Profile */,
                                ),
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  imageQuality: 80,
                                  allowPhoto: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  pickerFontFamily: 'Outfit',
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => isMediaUploading = true);
                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    isMediaUploading = false;
                                  }
                                  if (downloadUrls.length ==
                                      selectedMedia.length) {
                                    setState(() =>
                                        uploadedFileUrl = downloadUrls.first);
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload media');
                                    return;
                                  }
                                }
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2, 2, 2, 2),
                                  child: Container(
                                    width: 90,
                                    height: 90,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: valueOrDefault<String>(
                                        uploadedFileUrl,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/workout-web-app-manager-m1j9am/assets/v2bacnnrcrpc/addAvatarImage@2x.png',
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                        child: TextFormField(
                          controller: yourNameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              '36zkph5y' /* Your Name */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context).bodyText2,
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                        child: TextFormField(
                          controller: cityController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              '9b8owyq9' /* Your City */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context).bodyText2,
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                        child: FlutterFlowDropDown<String>(
                          initialOption: stateValue ??=
                              FFLocalizations.of(context).getText(
                            'sum5me41' /* State */,
                          ),
                          options: [
                            FFLocalizations.of(context).getText(
                              '1o58ylc8' /* State */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ay0cik2y' /* Alabama */,
                            ),
                            FFLocalizations.of(context).getText(
                              'th2bk0ym' /* Alaska */,
                            ),
                            FFLocalizations.of(context).getText(
                              'mc2ayhfs' /* Arizona */,
                            ),
                            FFLocalizations.of(context).getText(
                              '68lvaold' /* Arkansas */,
                            ),
                            FFLocalizations.of(context).getText(
                              'nvvqueql' /* California */,
                            ),
                            FFLocalizations.of(context).getText(
                              '9xsa6ulp' /* Colorado */,
                            ),
                            FFLocalizations.of(context).getText(
                              'yj2hqlt6' /* Connecticut */,
                            ),
                            FFLocalizations.of(context).getText(
                              'b7u2za9g' /* Delaware */,
                            ),
                            FFLocalizations.of(context).getText(
                              '55w6ie82' /* Florida */,
                            ),
                            FFLocalizations.of(context).getText(
                              'kjbrasqs' /* Georgia */,
                            ),
                            FFLocalizations.of(context).getText(
                              'uuo8ki6q' /* Hawaii */,
                            ),
                            FFLocalizations.of(context).getText(
                              'hhwyn2dk' /* Idaho */,
                            ),
                            FFLocalizations.of(context).getText(
                              'dj1e0s6x' /* Illinoi */,
                            ),
                            FFLocalizations.of(context).getText(
                              'wn461ugw' /* Indiana */,
                            ),
                            FFLocalizations.of(context).getText(
                              'e8pmqdt1' /* Iowa */,
                            ),
                            FFLocalizations.of(context).getText(
                              '3hrdqq3c' /* Kansas */,
                            ),
                            FFLocalizations.of(context).getText(
                              'fvrahmi7' /* Kentucky */,
                            ),
                            FFLocalizations.of(context).getText(
                              'wb3ikwta' /* Louisiana */,
                            ),
                            FFLocalizations.of(context).getText(
                              'tjvipti1' /* Maine */,
                            ),
                            FFLocalizations.of(context).getText(
                              '5odq2qqr' /* Maryland */,
                            ),
                            FFLocalizations.of(context).getText(
                              'sh02ys3b' /* Massachusetts */,
                            ),
                            FFLocalizations.of(context).getText(
                              'lqy7mzrt' /* Michigan */,
                            ),
                            FFLocalizations.of(context).getText(
                              'vrqzvcxf' /* Minnesota */,
                            ),
                            FFLocalizations.of(context).getText(
                              '5ims9zun' /* Mississippi */,
                            ),
                            FFLocalizations.of(context).getText(
                              'a64visv7' /* Missouri */,
                            ),
                            FFLocalizations.of(context).getText(
                              '99umqkel' /* Monta */,
                            ),
                            FFLocalizations.of(context).getText(
                              'hyx3ekee' /* Nebraska */,
                            ),
                            FFLocalizations.of(context).getText(
                              'i3yeihf3' /* Nevada */,
                            ),
                            FFLocalizations.of(context).getText(
                              'o0gwfqbr' /* New Hampshire */,
                            ),
                            FFLocalizations.of(context).getText(
                              't6kool76' /* New Jersey */,
                            ),
                            FFLocalizations.of(context).getText(
                              'mz5f7e1v' /* New Mexico */,
                            ),
                            FFLocalizations.of(context).getText(
                              'yqx1zzdr' /* New York */,
                            ),
                            FFLocalizations.of(context).getText(
                              'qo18yil9' /* North Carolina */,
                            ),
                            FFLocalizations.of(context).getText(
                              '34kafr09' /* North Dak */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ozhlxcej' /* Ohio */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ybp2nkcd' /* Oklahoma */,
                            ),
                            FFLocalizations.of(context).getText(
                              '1o6usb34' /* Oregon */,
                            ),
                            FFLocalizations.of(context).getText(
                              'j0i4djdx' /* Pennsylvani */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ahc6i725' /* Rhode Island */,
                            ),
                            FFLocalizations.of(context).getText(
                              'i0jrtggw' /* South Caroli */,
                            ),
                            FFLocalizations.of(context).getText(
                              '2802yhp8' /* South Dakota */,
                            ),
                            FFLocalizations.of(context).getText(
                              'cq5eyvxl' /* Tennessee */,
                            ),
                            FFLocalizations.of(context).getText(
                              'f1mx1412' /* Texas */,
                            ),
                            FFLocalizations.of(context).getText(
                              'qguuu1sz' /* Utah */,
                            ),
                            FFLocalizations.of(context).getText(
                              'jgpzvhmv' /* Vermont */,
                            ),
                            FFLocalizations.of(context).getText(
                              'bvyggt92' /* Virginia */,
                            ),
                            FFLocalizations.of(context).getText(
                              'tqdfvsp1' /* Washingto */,
                            ),
                            FFLocalizations.of(context).getText(
                              '2ovydsma' /* West Virginia */,
                            ),
                            FFLocalizations.of(context).getText(
                              'b9mjv7of' /* Wisconsin */,
                            ),
                            FFLocalizations.of(context).getText(
                              's8ctapc3' /* Wyoming */,
                            )
                          ],
                          onChanged: (val) => setState(() => stateValue = val),
                          width: double.infinity,
                          height: 56,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: FFLocalizations.of(context).getText(
                            '6cvw6ch4' /* Select State */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 15,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2,
                          borderColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          borderWidth: 2,
                          borderRadius: 50,
                          margin: EdgeInsetsDirectional.fromSTEB(20, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                        child: TextFormField(
                          controller: myBioController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context).bodyText2,
                            hintText: FFLocalizations.of(context).getText(
                              'gty9x3ww' /* Your bio */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0.05),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final usersUpdateData = createUsersRecordData(
                                displayName: yourNameController!.text,
                                photoUrl: uploadedFileUrl,
                                state: stateValue,
                                bio: myBioController!.text,
                                city: cityController!.text,
                              );
                              await currentUserReference!
                                  .update(usersUpdateData);

                              context.pushNamed('HomePage');
                            },
                            text: FFLocalizations.of(context).getText(
                              'nw1bqay5' /* Save Changes */,
                            ),
                            options: FFButtonOptions(
                              width: 270,
                              height: 50,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .subtitle1Family,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .subtitle1Family),
                                  ),
                              elevation: 2,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
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
