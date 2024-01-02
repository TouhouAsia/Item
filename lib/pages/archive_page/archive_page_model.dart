import '/backend/schema/structs/index.dart';
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
  // Model for ArchiveCard component.
  late ArchiveCardModel archiveCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    archiveCardModel = createModel(context, () => ArchiveCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    archiveCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
