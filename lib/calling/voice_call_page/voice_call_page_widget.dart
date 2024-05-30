import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'voice_call_page_model.dart';
export 'voice_call_page_model.dart';

class VoiceCallPageWidget extends StatefulWidget {
  const VoiceCallPageWidget({
    super.key,
    required this.callID,
    required this.userID,
    required this.userName,
  });

  final String? callID;
  final String? userID;
  final String? userName;

  @override
  State<VoiceCallPageWidget> createState() => _VoiceCallPageWidgetState();
}

class _VoiceCallPageWidgetState extends State<VoiceCallPageWidget> {
  late VoiceCallPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoiceCallPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: custom_widgets.CallRTC(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 1.0,
              callID: widget.callID!,
              userID: widget.userID!,
              userName: widget.userName!,
            ),
          ),
        ),
      ),
    );
  }
}
