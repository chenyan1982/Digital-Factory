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
            '49jcqbv0' /* Create Profile */,
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
                                  '8t9uzheh' /* Create Profile */,
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
                              '0utv8zgf' /* Your Name */,
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
                              'rojigrmt' /* Your City */,
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
                            '1xr0dexa' /* State */,
                          ),
                          options: [
                            FFLocalizations.of(context).getText(
                              'l7bcdecp' /* State */,
                            ),
                            FFLocalizations.of(context).getText(
                              '1a5rz8d2' /* Alabama */,
                            ),
                            FFLocalizations.of(context).getText(
                              'm5y7mz8g' /* Alaska */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ouuzm4mw' /* Arizona */,
                            ),
                            FFLocalizations.of(context).getText(
                              'n2kptme2' /* Arkansas */,
                            ),
                            FFLocalizations.of(context).getText(
                              'rj63afa8' /* California */,
                            ),
                            FFLocalizations.of(context).getText(
                              '4372hs22' /* Colorado */,
                            ),
                            FFLocalizations.of(context).getText(
                              'f5c69gn0' /* Connecticut */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ff2ecqd0' /* Delaware */,
                            ),
                            FFLocalizations.of(context).getText(
                              'uz4617iv' /* Florida */,
                            ),
                            FFLocalizations.of(context).getText(
                              'gfbk0de7' /* Georgia */,
                            ),
                            FFLocalizations.of(context).getText(
                              'rzzsnmte' /* Hawaii */,
                            ),
                            FFLocalizations.of(context).getText(
                              '5jjheo6s' /* Idaho */,
                            ),
                            FFLocalizations.of(context).getText(
                              '9xukawl3' /* Illinoi */,
                            ),
                            FFLocalizations.of(context).getText(
                              'fwrw3y19' /* Indiana */,
                            ),
                            FFLocalizations.of(context).getText(
                              'owk1p9dp' /* Iowa */,
                            ),
                            FFLocalizations.of(context).getText(
                              '2jaf5o77' /* Kansas */,
                            ),
                            FFLocalizations.of(context).getText(
                              '4f3x00uo' /* Kentucky */,
                            ),
                            FFLocalizations.of(context).getText(
                              'pkutxruf' /* Louisiana */,
                            ),
                            FFLocalizations.of(context).getText(
                              'jfe7dbtu' /* Maine */,
                            ),
                            FFLocalizations.of(context).getText(
                              'riae458m' /* Maryland */,
                            ),
                            FFLocalizations.of(context).getText(
                              'aeuqbree' /* Massachusetts */,
                            ),
                            FFLocalizations.of(context).getText(
                              'k6516rep' /* Michigan */,
                            ),
                            FFLocalizations.of(context).getText(
                              'oesjqokk' /* Minnesota */,
                            ),
                            FFLocalizations.of(context).getText(
                              '4l013y4k' /* Mississippi */,
                            ),
                            FFLocalizations.of(context).getText(
                              'n4byh7yq' /* Missouri */,
                            ),
                            FFLocalizations.of(context).getText(
                              '483zot8y' /* Monta */,
                            ),
                            FFLocalizations.of(context).getText(
                              '5dl70m25' /* Nebraska */,
                            ),
                            FFLocalizations.of(context).getText(
                              '9z6ucfxr' /* Nevada */,
                            ),
                            FFLocalizations.of(context).getText(
                              '50hu934a' /* New Hampshire */,
                            ),
                            FFLocalizations.of(context).getText(
                              'z8zc17y1' /* New Jersey */,
                            ),
                            FFLocalizations.of(context).getText(
                              '5ygdlnyz' /* New Mexico */,
                            ),
                            FFLocalizations.of(context).getText(
                              '8i88r8pa' /* New York */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ch493xs5' /* North Carolina */,
                            ),
                            FFLocalizations.of(context).getText(
                              'jcneqsn7' /* North Dak */,
                            ),
                            FFLocalizations.of(context).getText(
                              '1m8f0w6z' /* Ohio */,
                            ),
                            FFLocalizations.of(context).getText(
                              'vly86v6g' /* Oklahoma */,
                            ),
                            FFLocalizations.of(context).getText(
                              'xc4u6qlh' /* Oregon */,
                            ),
                            FFLocalizations.of(context).getText(
                              'vra6obac' /* Pennsylvani */,
                            ),
                            FFLocalizations.of(context).getText(
                              'i7py80jo' /* Rhode Island */,
                            ),
                            FFLocalizations.of(context).getText(
                              'u5gz507n' /* South Caroli */,
                            ),
                            FFLocalizations.of(context).getText(
                              '7w94qj9e' /* South Dakota */,
                            ),
                            FFLocalizations.of(context).getText(
                              '58e6ws1e' /* Tennessee */,
                            ),
                            FFLocalizations.of(context).getText(
                              '2ytyi7gz' /* Texas */,
                            ),
                            FFLocalizations.of(context).getText(
                              'enitnfpa' /* Utah */,
                            ),
                            FFLocalizations.of(context).getText(
                              'nwqevjxp' /* Vermont */,
                            ),
                            FFLocalizations.of(context).getText(
                              's8xai7rl' /* Virginia */,
                            ),
                            FFLocalizations.of(context).getText(
                              '5equd54b' /* Washingto */,
                            ),
                            FFLocalizations.of(context).getText(
                              'zukuhigj' /* West Virginia */,
                            ),
                            FFLocalizations.of(context).getText(
                              'rlskah2n' /* Wisconsin */,
                            ),
                            FFLocalizations.of(context).getText(
                              'accazyf9' /* Wyoming */,
                            )
                          ],
                          onChanged: (val) => setState(() => stateValue = val),
                          width: double.infinity,
                          height: 56,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: FFLocalizations.of(context).getText(
                            '410hnlga' /* Select State */,
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
                              '5dkgt7rd' /* Your bio */,
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
                              '0pxdperx' /* Save Changes */,
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
