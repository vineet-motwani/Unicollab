// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallRTC extends StatefulWidget {
  const CallRTC({
    super.key,
    this.width,
    this.height,
    required this.callID,
    required this.userID,
    required this.userName,
  });

  final double? width;
  final double? height;
  final String callID;
  final String userID;
  final String userName;

  @override
  State<CallRTC> createState() => _CallRTCState();
}

class _CallRTCState extends State<CallRTC> {
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          1853481111, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          "5b361d5e2d6f44e56e61b7e762487b67c68e443399bc11467fa75ff315bbec3b", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: widget.userID,
      userName: widget.userName,
      callID: widget.callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.groupVoiceCall(),
    );
  }
}
