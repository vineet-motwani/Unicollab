import '/flutter_flow/flutter_flow_util.dart';
import 'video_call_page_widget.dart' show VideoCallPageWidget;
import 'package:flutter/material.dart';

class VideoCallPageModel extends FlutterFlowModel<VideoCallPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
