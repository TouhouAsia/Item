import '/backend/schema/structs/index.dart';
import '/components/archive_card/archive_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'archive_page_model.dart';
export 'archive_page_model.dart';

class ArchivePageWidget extends StatefulWidget {
  const ArchivePageWidget({Key? key}) : super(key: key);

  @override
  _ArchivePageWidgetState createState() => _ArchivePageWidgetState();
}

class _ArchivePageWidgetState extends State<ArchivePageWidget> {
  late ArchivePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArchivePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'zz3s5ksy' /* Archive */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineLarge,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    8.0,
                    0,
                    44.0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    wrapWithModel(
                      model: _model.archiveCardModel,
                      updateCallback: () => setState(() {}),
                      child: ArchiveCardWidget(
                        item: ItemInfoStruct(
                          name: 'name',
                          info: 'info',
                          price: 1.0,
                          buyTime: DateTime.fromMicrosecondsSinceEpoch(
                              1702742400000000),
                          image:
                              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.johnlewis.com%2Felectricals%2Fmobile-phones-accessories%2Fc60000469&psig=AOvVaw0LmYnyWPM46-I4Vq8q4D1b&ust=1702825363518000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMjK-NCrlIMDFQAAAAAdAAAAABAE',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
