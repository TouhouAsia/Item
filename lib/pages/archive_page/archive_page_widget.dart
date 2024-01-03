import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
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
                FutureBuilder<List<IteminfoRow>>(
                  future: IteminfoTable().queryRows(
                    queryFn: (q) => q
                        .eq(
                          'owner',
                          FFAppState().hashcode,
                        )
                        .eq(
                          'is_archive',
                          true,
                        )
                        .order('buy_time'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<IteminfoRow> listViewIteminfoRowList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        8.0,
                        0,
                        44.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewIteminfoRowList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewIteminfoRow =
                            listViewIteminfoRowList[listViewIndex];
                        return wrapWithModel(
                          model: _model.archiveCardModels.getModel(
                            listViewIndex.toString(),
                            listViewIndex,
                          ),
                          updateCallback: () => setState(() {}),
                          child: ArchiveCardWidget(
                            key: Key(
                              'Keyyrr_${listViewIndex.toString()}',
                            ),
                            item: ItemInfoStruct(
                              name: listViewIteminfoRow.name,
                              info: listViewIteminfoRow.info,
                              price: listViewIteminfoRow.price,
                              buyTime: listViewIteminfoRow.buyTime,
                              image: listViewIteminfoRow.image,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
