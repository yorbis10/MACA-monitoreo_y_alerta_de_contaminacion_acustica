import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loaderio4fa2ac6b82b493ece426faa81d23b900_model.dart';
export 'loaderio4fa2ac6b82b493ece426faa81d23b900_model.dart';

/// pruebas de estrés y rendimiento
class Loaderio4fa2ac6b82b493ece426faa81d23b900Widget extends StatefulWidget {
  const Loaderio4fa2ac6b82b493ece426faa81d23b900Widget({super.key});

  static String routeName = 'loaderio4fa2ac6b82b493ece426faa81d23b900';
  static String routePath = '/loaderio4fa2ac6b82b493ece426faa81d23b900';

  @override
  State<Loaderio4fa2ac6b82b493ece426faa81d23b900Widget> createState() =>
      _Loaderio4fa2ac6b82b493ece426faa81d23b900WidgetState();
}

class _Loaderio4fa2ac6b82b493ece426faa81d23b900WidgetState
    extends State<Loaderio4fa2ac6b82b493ece426faa81d23b900Widget> {
  late Loaderio4fa2ac6b82b493ece426faa81d23b900Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => Loaderio4fa2ac6b82b493ece426faa81d23b900Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'j75o20hv' /* Pruebas de estrés y rendimient... */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'pcmbljj4' /* loaderio-4fa2ac6b82b493ece426f... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.readexPro(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
