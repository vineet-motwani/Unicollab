import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'student_info_widget.dart' show StudentInfoWidget;
import 'package:flutter/material.dart';

class StudentInfoModel extends FlutterFlowModel<StudentInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for stateName widget.
  String? stateNameValue;
  FormFieldController<String>? stateNameValueController;
  // State field(s) for cityName widget.
  String? cityNameValue;
  FormFieldController<String>? cityNameValueController;
  // State field(s) for collegeName widget.
  String? collegeNameValue;
  FormFieldController<String>? collegeNameValueController;
  // State field(s) for studentYear widget.
  String? studentYearValue;
  FormFieldController<String>? studentYearValueController;
  // State field(s) for branchName widget.
  String? branchNameValue;
  FormFieldController<String>? branchNameValueController;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? foundGroup;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
