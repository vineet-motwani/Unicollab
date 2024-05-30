import '/flutter_flow/flutter_flow_util.dart';
import 'voice_call_page_widget.dart' show VoiceCallPageWidget;
import 'package:flutter/material.dart';

class VoiceCallPageModel extends FlutterFlowModel<VoiceCallPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
