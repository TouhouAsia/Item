import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/archive_card/archive_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'archive_page_widget.dart' show ArchivePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArchivePageModel extends FlutterFlowModel<ArchivePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for ArchiveCard dynamic component.
  late FlutterFlowDynamicModels<ArchiveCardModel> archiveCardModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    archiveCardModels = FlutterFlowDynamicModels(() => ArchiveCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    archiveCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
