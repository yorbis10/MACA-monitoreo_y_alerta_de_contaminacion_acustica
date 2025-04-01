import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'recuperar_clave_widget.dart' show RecuperarClaveWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecuperarClaveModel extends FlutterFlowModel<RecuperarClaveWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  String? _correoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zoz80tix' /* El correo es obligatorio  Ej. ... */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'ja56n979' /* Cantidad de caracteres  del co... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'rbknxa61' /* El formato del correo no es va... */,
      );
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    correoTextControllerValidator = _correoTextControllerValidator;
  }

  @override
  void dispose() {
    correoFocusNode?.dispose();
    correoTextController?.dispose();
  }
}
