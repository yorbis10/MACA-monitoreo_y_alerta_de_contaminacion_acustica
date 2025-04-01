import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'registro_usuario_widget.dart' show RegistroUsuarioWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RegistroUsuarioModel extends FlutterFlowModel<RegistroUsuarioWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ahq13p5f' /* El nombre es obligatorio */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'wg7lk5y0' /* El nombre debe contener minimo... */,
      );
    }
    if (val.length > 150) {
      return FFLocalizations.of(context).getText(
        '2goszjsj' /* El nombre no debe exceder mas ... */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qu5rlvyo' /* El correo es obligatorio Ej. i... */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'p8dmshzk' /* Cantidad de caracteres  del co... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'k0fa5zbs' /* El formato del correo no es va... */,
      );
    }
    return null;
  }

  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  String? _telefonoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uqxanzuz' /* El número de telefono es oblig... */,
      );
    }

    if (val.length < 7) {
      return FFLocalizations.of(context).getText(
        'ovv327b6' /* Solo números,  ej: 4441122 */,
      );
    }
    if (val.length > 15) {
      return FFLocalizations.of(context).getText(
        'koy67ut4' /* No puede tenes mas de 15 carac... */,
      );
    }
    if (!RegExp('^\\d{7,15}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'm3jlci3n' /* El numero ingresado no es corr... */,
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
        '5i54izd0' /* La contraseña es obligatoria */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'h0nh5vvp' /* Debe ingresar MInimo 6 caracte... */,
      );
    }
    if (val.length > 25) {
      return FFLocalizations.of(context).getText(
        '1vighw4l' /* La contraseña no debe superar ... */,
      );
    }
    if (!RegExp(
            '^(?=.*\\d)(?=.*[\\u0021-\\u002b\\u003c-\\u0040])(?=.*[A-Z])(?=.*[a-z])\\S{6,25}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'zsw95hs0' /* La contraseña no cumple con lo... */,
      );
    }
    return null;
  }

  // State field(s) for confirmaclave widget.
  FocusNode? confirmaclaveFocusNode;
  TextEditingController? confirmaclaveTextController;
  late bool confirmaclaveVisibility;
  String? Function(BuildContext, String?)? confirmaclaveTextControllerValidator;
  String? _confirmaclaveTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qbl2e27w' /* La confirmacion de contraseña ... */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    telefonoTextControllerValidator = _telefonoTextControllerValidator;
    claveVisibility = false;
    claveTextControllerValidator = _claveTextControllerValidator;
    confirmaclaveVisibility = false;
    confirmaclaveTextControllerValidator =
        _confirmaclaveTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    claveFocusNode?.dispose();
    claveTextController?.dispose();

    confirmaclaveFocusNode?.dispose();
    confirmaclaveTextController?.dispose();
  }
}
