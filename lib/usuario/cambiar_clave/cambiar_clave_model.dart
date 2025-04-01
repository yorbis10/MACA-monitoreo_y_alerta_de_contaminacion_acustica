import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'cambiar_clave_widget.dart' show CambiarClaveWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CambiarClaveModel extends FlutterFlowModel<CambiarClaveWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for claveActual widget.
  FocusNode? claveActualFocusNode;
  TextEditingController? claveActualTextController;
  late bool claveActualVisibility;
  String? Function(BuildContext, String?)? claveActualTextControllerValidator;
  // State field(s) for nuevaClave widget.
  FocusNode? nuevaClaveFocusNode;
  TextEditingController? nuevaClaveTextController;
  late bool nuevaClaveVisibility;
  String? Function(BuildContext, String?)? nuevaClaveTextControllerValidator;
  // State field(s) for confirmaClave widget.
  FocusNode? confirmaClaveFocusNode;
  TextEditingController? confirmaClaveTextController;
  late bool confirmaClaveVisibility;
  String? Function(BuildContext, String?)? confirmaClaveTextControllerValidator;
  // Stores action output result for [Custom Action - changePassword] action in Button widget.
  bool? isChange;

  @override
  void initState(BuildContext context) {
    claveActualVisibility = false;
    nuevaClaveVisibility = false;
    confirmaClaveVisibility = false;
  }

  @override
  void dispose() {
    claveActualFocusNode?.dispose();
    claveActualTextController?.dispose();

    nuevaClaveFocusNode?.dispose();
    nuevaClaveTextController?.dispose();

    confirmaClaveFocusNode?.dispose();
    confirmaClaveTextController?.dispose();
  }
}
