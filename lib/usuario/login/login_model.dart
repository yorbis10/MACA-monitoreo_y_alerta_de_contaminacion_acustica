import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  String? _correoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mxnp4isy' /* El correo es obligatorio */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'e9kxbi64' /* Cantidad de caracteres  del co... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '5uz2zhht' /* El formato del correo no es va... */,
      );
    }
    return null;
  }

  // State field(s) for clave widget.
  FocusNode? claveFocusNode;
  TextEditingController? claveTextController;
  late bool claveVisibility;
  String? Function(BuildContext, String?)? claveTextControllerValidator;
  String? _claveTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'djmyy7bb' /* La contraseña es obligatoria */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'ksapcnjs' /* Debe ingresar MInimo 6 caracte... */,
      );
    }
    if (val.length > 25) {
      return FFLocalizations.of(context).getText(
        '9inopavz' /* La contraseña no debe superar ... */,
      );
    }
    if (!RegExp(
            '^(?=.*\\d)(?=.*[\\u0021-\\u002b\\u003c-\\u0040])(?=.*[A-Z])(?=.*[a-z])\\S{6,25}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '1st2vfhx' /* La contraseña no cumple con lo... */,
      );
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    correoTextControllerValidator = _correoTextControllerValidator;
    claveVisibility = false;
    claveTextControllerValidator = _claveTextControllerValidator;
  }

  @override
  void dispose() {
    correoFocusNode?.dispose();
    correoTextController?.dispose();

    claveFocusNode?.dispose();
    claveTextController?.dispose();
  }
}
